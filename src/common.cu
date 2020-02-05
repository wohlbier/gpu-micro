#include <getopt.h>
#include <stdio.h>

#include "common.h"

thread_local int is_main_thread = 0;

static int nThreads = 1;
static int nGpus = 1;
static size_t minBytes = 32*1024*1024;
static size_t maxBytes = 32*1024*1024;
static size_t stepBytes = 1*1024*1024;
static size_t stepFactor = 1;
static int datacheck = 1;
static int warmup_iters = 5;
static int iters = 20;

double parsesize(char *value) {
    long long int units;
    double size;

    if (strchr(value, 'G') != NULL) {
        units=1024*1024*1024;
    } else if (strchr(value, 'M') != NULL) {
	units=1024*1024;
    } else if (strchr(value, 'K') != NULL) {
        units=1024;
    } else {
        units=1;
    }

    size = atof(value)*units;
    return size;
}

testResult_t AllocateBuffs(void **sendbuff, size_t sendBytes, void **recvbuff,
                           size_t recvBytes, void **expected, size_t nbytes,
                           int nranks) {
    printf("%d %d\n", nbytes, recvBytes);

    CUDACHECK(cudaMalloc(sendbuff, nbytes));
    CUDACHECK(cudaMalloc(recvbuff, nbytes));
    CUDACHECK(cudaMalloc(expected, recvBytes));
    return testSuccess;
}

testResult_t run();

int main(int argc, char* argv[]) {
  // Make sure everyline is flushed so that we see the progress of the test
  setlinebuf(stdout);

  // Parse args
  int longindex;
  static struct option longopts[] = {
      {"nthreads", required_argument, 0, 't'},
      {"ngpus", required_argument, 0, 'g'},
      {"minbytes", required_argument, 0, 'b'},
      {"maxbytes", required_argument, 0, 'e'},
      {"stepbytes", required_argument, 0, 'i'},
      {"stepfactor", required_argument, 0, 'f'},
      {"iters", required_argument, 0, 'n'},
      {"agg_iters", required_argument, 0, 'm'},
      {"warmup_iters", required_argument, 0, 'w'},
      {"check", required_argument, 0, 'c'},
      {"help", no_argument, 0, 'h'}
  };

  while(1) {
      int c;
      c = getopt_long(argc, argv, "t:g:b:e:i:f:n:w:c:h", longopts,
                      &longindex);
      if (c == -1)
          break;
      switch(c) {
      case 't':
          nThreads = strtol(optarg, NULL, 0);
          break;
      case 'g':
          nGpus = strtol(optarg, NULL, 0);
          break;
      case 'b':
          minBytes = (size_t)parsesize(optarg);
          break;
      case 'e':
          maxBytes = (size_t)parsesize(optarg);
          break;
      case 'i':
          stepBytes = strtol(optarg, NULL, 0);
          break;
      case 'f':
          stepFactor = strtol(optarg, NULL, 0);
          break;
      case 'n':
          iters = (int)strtol(optarg, NULL, 0);
          break;
      case 'w':
          warmup_iters = (int)strtol(optarg, NULL, 0);
          break;
      case 'c':
          datacheck = (int)strtol(optarg, NULL, 0);
          break;
      case 'h':
          printf("USAGE: %s \n\t"
                 "[-t,--nthreads <num threads>] \n\t"
                 "[-g,--ngpus <gpus per thread>] \n\t"
                 "[-b,--minbytes <min size in bytes>] \n\t"
                 "[-e,--maxbytes <max size in bytes>] \n\t"
                 "[-i,--stepbytes <increment size>] \n\t"
                 "[-f,--stepfactor <increment factor>] \n\t"
                 "[-n,--iters <iteration count>] \n\t"
                 "[-m,--agg_iters <aggregated iteration count>] \n\t"
                 "[-w,--warmup_iters <warmup iteration count>] \n\t"
                 "[-c,--check <0/1>] \n\t"
                 "[-h,--help]\n",
                 basename(argv[0]));
        return 0;
      default:
          printf("invalid option \n");
          printf("USAGE: %s \n\t"
                 "[-t,--nthreads <num threads>] \n\t"
                 "[-g,--ngpus <gpus per thread>] \n\t"
                 "[-b,--minbytes <min size in bytes>] \n\t"
                 "[-e,--maxbytes <max size in bytes>] \n\t"
                 "[-i,--stepbytes <increment size>] \n\t"
                 "[-f,--stepfactor <increment factor>] \n\t"
                 "[-n,--iters <iteration count>] \n\t"
                 "[-m,--agg_iters <aggregated iteration count>] \n\t"
                 "[-w,--warmup_iters <warmup iteration count>] \n\t"
                 "[-c,--check <0/1>] \n\t"
                 "[-h,--help]\n",
                 basename(argv[0]));
          return 0;
    }
  }
  return run();
}

testResult_t run() {
    int nProcs = 1, proc = 0;
    int localRank = 0;
    char hostname[1024];
    getHostName(hostname, 1024);

    is_main_thread = (proc == 0) ? 1 : 0;

    PRINT("# nThread %d nGpus %d minBytes %ld maxBytes %ld step: %ld(%s) warmup iters: %d iters: %d validation: %d \n",
          nThreads, nGpus, minBytes, maxBytes,
          (stepFactor > 1)?stepFactor:stepBytes,
          (stepFactor > 1)?"factor":"bytes",
          warmup_iters, iters, datacheck);

    PRINT("# Using devices\n");
#define MAX_LINE 2048
    char line[MAX_LINE];
    int len = 0;
    for (int i=0; i<nThreads*nGpus; i++) {
        int cudaDev = localRank*nThreads*nGpus+i;
        int rank = proc*nThreads*nGpus+i;
        cudaDeviceProp prop;
        CUDACHECK(cudaGetDeviceProperties(&prop, cudaDev));
        len += snprintf(line+len, MAX_LINE-len,
                        "#Rank %2d Pid %6d on %10s device %2d [0x%02x] %s\n",
                        rank, getpid(), hostname, cudaDev, prop.pciBusID,
                        prop.name);
    }
    PRINT("%s", line);

    cudaStream_t streams[nGpus*nThreads];
    void* sendbuffs[nGpus*nThreads];
    void* recvbuffs[nGpus*nThreads];
    void* expected[nGpus*nThreads];
    size_t sendBytes, recvBytes;

    microTestEngine.getBuffSize(&sendBytes, &recvBytes, (size_t)maxBytes,
                                (size_t)nProcs*nGpus*nThreads);

  for (int i=0; i<nGpus*nThreads; i++) {
      CUDACHECK(cudaSetDevice(localRank*nThreads*nGpus+i));
      AllocateBuffs(sendbuffs+i, sendBytes, recvbuffs+i, recvBytes, expected+i,
                    (size_t)maxBytes, nProcs*nThreads*nGpus);
      CUDACHECK(cudaStreamCreateWithFlags(streams+i, cudaStreamNonBlocking));
  }

//  //if parallel init is not selected, use main thread to initialize NCCL
//  ncclComm_t* comms = (ncclComm_t*)malloc(sizeof(ncclComm_t)*nThreads*nGpus);
//  if (!parallel_init) {
//     if (nProcs == 1) {
//       int gpuArray[nGpus*nThreads];
//       for (int i=0; i<nGpus*nThreads; i++) gpuArray[i] = i;
//       NCCLCHECK(ncclCommInitAll(comms, nGpus*nThreads, gpuArray));
//     } else {
//       NCCLCHECK(ncclGroupStart());
//       for (int i=0; i<nGpus*nThreads; i++) {
//         CUDACHECK(cudaSetDevice(localRank*nThreads*nGpus+i));
//         NCCLCHECK(ncclCommInitRank(comms+i, nProcs*nThreads*nGpus, ncclId, pro\
//c*nThreads*nGpus+i));
//       }
//       NCCLCHECK(ncclGroupEnd());
//     }
//  }

//  int errors[nThreads];
//  double bw[nThreads];
//  double* delta;
//  CUDACHECK(cudaHostAlloc(&delta, sizeof(double)*nThreads, cudaHostAllocPortabl\
//e | cudaHostAllocMapped));
//  int bw_count[nThreads];
//  for (int t=0; t<nThreads; t++) {
//    bw[t] = 0.0;
//    errors[t] = bw_count[t] = 0;
//  }
//  PRINT("#\n");
//  print_header();

//  int* sync = (int*)calloc(2, sizeof(int));
//  int* barrier = (int*)calloc(2, sizeof(int));

//  struct testThread threads[nThreads];
//  memset(threads, 0, sizeof(struct testThread)*nThreads);

//  for (int t=nThreads-1; t>=0; t--) {
//    threads[t].args.minbytes=minBytes;
//    threads[t].args.maxbytes=maxBytes;
//    threads[t].args.stepbytes=stepBytes;
//    threads[t].args.stepfactor=stepFactor;
//    threads[t].args.localRank = localRank;

//    threads[t].args.nProcs=nProcs;
//    threads[t].args.proc=proc;
//    threads[t].args.nThreads=nThreads;
//    threads[t].args.thread=t;
//    threads[t].args.nGpus=nGpus;
//    threads[t].args.sendbuffs = sendbuffs+t*nGpus;
//    threads[t].args.recvbuffs = recvbuffs+t*nGpus;
//    threads[t].args.expected = expected+t*nGpus;
//    threads[t].args.ncclId = ncclId;
//    threads[t].args.comms=comms+t*nGpus;
//    threads[t].args.streams=streams+t*nGpus;

//    threads[t].args.barrier = (volatile int*)barrier;
//    threads[t].args.barrier_idx = 0;
//    threads[t].args.sync = (volatile int*)sync;
//    threads[t].args.sync_idx = 0;
//    threads[t].args.deltaThreads = delta;
//    threads[t].args.deltaHost = (delta + t);
//    threads[t].args.delta = delta;
//    threads[t].args.errors=errors+t;
//    threads[t].args.bw=bw+t;
//    threads[t].args.bw_count=bw_count+t;

//    threads[t].func = parallel_init ? threadInit : threadRunTests;
//    if (t)
//      TESTCHECK(threadLaunch(threads+t));
//    else
//      TESTCHECK(threads[t].func(&threads[t].args));
//  }

//  // Wait for other threads and accumulate stats and errors
//  for (int t=nThreads-1; t>=0; t--) {
//    if (t) pthread_join(threads[t].thread, NULL);
//    TESTCHECK(threads[t].ret);
//    if (t) {
//      errors[0] += errors[t];
//      bw[0] += bw[t];
//      bw_count[0] += bw_count[t];
//    }
//  }

//#ifdef MPI_SUPPORT
//  MPI_Allreduce(MPI_IN_PLACE, &errors[0], 1, MPI_INT, MPI_SUM, MPI_COMM_WORLD);
//#endif

// if (!parallel_init) {
//    for(int i=0; i<nGpus*nThreads; ++i)
//      NCCLCHECK(ncclCommDestroy(comms[i]));
//    free(comms);
//  }

//  // Free off CUDA allocated memory
//  for (int i=0; i<nGpus*nThreads; i++) {
//    CUDACHECK(cudaFree(sendbuffs[i]));
//    CUDACHECK(cudaFree(recvbuffs[i]));
//    CUDACHECK(cudaFree(expected[i]));
//  }
//  CUDACHECK(cudaFreeHost(delta));

//  char* str = getenv("NCCL_TESTS_MIN_BW");
//  double check_avg_bw = str ? atof(str) : -1;
//  bw[0] /= bw_count[0];

//  PRINT("# Out of bounds values : %d %s\n", errors[0], errors[0] ? "FAILED" : "\
//OK");
//  PRINT("# Avg bus bandwidth    : %g %s\n", bw[0], check_avg_bw == -1 ? "" : (b\
//w[0] < check_avg_bw*(0.9) ? "FAILED" : "OK"));
//  PRINT("#\n");
//#ifdef MPI_SUPPORT
//  MPI_Finalize();
//#endif

//  // 'cuda-memcheck --leak-check full' requires this
//  cudaDeviceReset();

//  if (errors[0] || bw[0] < check_avg_bw*(0.9))
//    exit(EXIT_FAILURE);
//  else
//    exit(EXIT_SUCCESS);
    testResult_t tr;
    return tr;
}

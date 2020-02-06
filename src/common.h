#ifndef COMMON_H
#define COMMON_H

#include <stdio.h>
#include <pthread.h>

typedef double microDataType_t;

#define CUDACHECK(cmd) do {                                \
    cudaError_t e = cmd;                                   \
    if( e != cudaSuccess ) {                               \
        char hostname[1024];                               \
        getHostName(hostname, 1024);                       \
        printf("%s: Test CUDA failure %s:%d '%s'\n",       \
               hostname,                                   \
               __FILE__,__LINE__,cudaGetErrorString(e));   \
        return testCudaError;                              \
    }                                                      \
} while(0)

typedef enum {
    testSuccess = 0,
    testInternalError = 1,
    testCudaError = 2,
    testCuRandError = 3
} testResult_t;

// Relay errors up and trace
#define TESTCHECK(cmd) do {                             \
        testResult_t r = cmd;                           \
        if (r!= testSuccess) {                          \
            char hostname[1024];                        \
            getHostName(hostname, 1024);                \
            printf(" .. %s: Test failure %s:%d\n",      \
                   hostname,                            \
                   __FILE__,__LINE__);                  \
            return r;                                   \
        }                                               \
} while(0)

struct testMicro {
    const char name[20];
//    void (*getMicroByteCount)(
//        size_t *sendcount, size_t *recvcount, size_t *paramcount,
//        size_t *sendInplaceOffset, size_t *recvInplaceOffset,
//        size_t count, int nranks);
//    testResult_t (*initData)(struct threadArgs* args, ncclDataType_t type,
//                             ncclRedOp_t op, int root, int rep, int in_place);
//    void (*getBw)(size_t count, int typesize, double sec, double* algBw,
//                  double* busBw, int nranks);
//    testResult_t (*runMicro)(void* sendbuff, void* recvbuff, size_t count,
//                            ncclDataType_t type, ncclRedOp_t op, int root,
//                            ncclComm_t comm, cudaStream_t stream);
};
extern struct testMicro copyTest;

struct testEngine {
    void (*getBuffSize)(size_t *sendcount, size_t *recvcount, size_t count,
                        int nranks);
    testResult_t (*runTest)(struct threadArgs* args, int root,
                            microDataType_t type);
                            //const char* typeName, ncclRedOp_t op,
                            //const char* opName);
};
extern struct testEngine microTestEngine;

struct threadArgs {
    size_t nbytes;
    size_t minbytes;
    size_t maxbytes;
    size_t stepbytes;
    size_t stepfactor;

    int nThreads;
    int thread;
    int nGpus;
    int localRank;

    void** sendbuffs;
    void** recvbuffs;
    cudaStream_t* streams;

    void** expected;
};

typedef testResult_t (*threadFunc_t)(struct threadArgs* args);
struct testThread {
    pthread_t thread;
    threadFunc_t func;
    struct threadArgs args;
    testResult_t ret;
};

// provided by common.cu
extern void AllocateBuffs(void **sendbuff, void **recvbuff, void **expected,
                          void **expectedHost, size_t nbytes, int nranks);

// provided by test
extern void print_header();

#include <unistd.h>
static void getHostName(char* hostname, int maxlen) {
  gethostname(hostname, maxlen);
  for (int i=0; i< maxlen; i++) {
    if (hostname[i] == '.') {
      hostname[i] = '\0';
      return;
    }
  }
}

extern thread_local int is_main_thread;
#define PRINT if (is_main_thread) printf

#endif // COMMON_H

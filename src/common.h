#ifndef COMMON_H
#define COMMON_H

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
    testNcclError = 3,
    testCuRandError = 4
} testResult_t;

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
};

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

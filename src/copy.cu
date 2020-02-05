#include "common.h"

void CopyGetCollByteCount(size_t *sendcount, size_t *recvcount,
                          size_t *paramcount, size_t *sendInplaceOffset,
                          size_t *recvInplaceOffset, size_t count, int nranks)
{
  *sendcount = count;
  *recvcount = count;
  *sendInplaceOffset = 0;
  *recvInplaceOffset = 0;
  *paramcount = *sendcount;
}

void CopyGetBuffSize(size_t *sendcount, size_t *recvcount, size_t count,
                     int nranks) {
    size_t paramcount, sendInplaceOffset, recvInplaceOffset;
    CopyGetCollByteCount(sendcount, recvcount, &paramcount, &sendInplaceOffset,
                         &recvInplaceOffset, count, nranks);
}

testResult_t CopyRunTest(struct threadArgs* args, int root,
                         microDataType_t type) {
                         //const char* typeName, ncclRedOp_t op,
                         //const char* opName) {
//    args->collTest = &reduceTest;
//    ncclDataType_t *run_types;
//    ncclRedOp_t *run_ops;
//    const char **run_typenames, **run_opnames;
//    int type_count, op_count;
//    int begin_root, end_root;
//
//    if ((int)type != -1) {
//        type_count = 1;
//        run_types = &type;
//        run_typenames = &typeName;
//    } else {
//        type_count = ncclNumTypes;
//        run_types = test_types;
//        run_typenames = test_typenames;
//    }
//
//    if ((int)op != -1) {
//        op_count = 1;
//        run_ops = &op;
//        run_opnames = &opName;
//    } else {
//        op_count = ncclNumOps;
//        run_ops = test_ops;
//        run_opnames = test_opnames;
//    }
//
//    if (root != -1) {
//        begin_root = end_root = root;
//    } else {
//        begin_root = 0;
//        end_root = args->nProcs*args->nThreads*args->nGpus-1;
//    }
//
//    for (int i=0; i<type_count; i++) {
//        for (int j=0; j<op_count; j++) {
//            for (int k=begin_root; k<=end_root; k++) {
//                TESTCHECK(TimeTest(args, run_types[i], run_typenames[i], run_ops[j], run_opnames[j], k));
//            }
//        }
//    }
    return testSuccess;
}

struct testEngine copyEngine = {
    CopyGetBuffSize,
    CopyRunTest
};

#pragma weak microTestEngine=copyEngine

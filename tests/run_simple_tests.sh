#!/bin/bash

# Get script directory
if [ -L $0 ] ; then
    SCRIPT_DIR=$(dirname $(readlink -f $0)) ;
else
    SCRIPT_DIR=$(dirname $0) ;
fi ;

# Set test file
TEST_FILE=${SCRIPT_DIR}/simple_tests_files/simple_double_free.c

# Get test name
TEST_NAME=$(basename "${TEST_FILE}" .c)

# Set result dir
RESULT_DIR=${SCRIPT_DIR}/simple_tests_results

# Clean results
rm -rf ${RESULT_DIR}
mkdir ${RESULT_DIR}

# Build llvm if needed
./${SCRIPT_DIR}/../softboundcets-llvm-clang34/build.sh

# Build softboundcets
./${SCRIPT_DIR}/../softboundcets-lib/build.sh > /dev/null 2>&1

# Set llvm dir
LLVM_DIR=${SCRIPT_DIR}/../softboundcets-llvm-clang34/build/Release+Asserts/bin

# Set softboundcets dir
SOFTBOUNDCETS_DIR=${SCRIPT_DIR}/../softboundcets-lib

# Build without CETS using default clang
clang -O0 -S -emit-llvm ${TEST_FILE} -o ${RESULT_DIR}/${TEST_NAME}_no_CETS.ll
clang -O0 ${TEST_FILE} -o ${RESULT_DIR}/${TEST_NAME}_no_CETS.bin

# Build with CETS using compiled clang
${LLVM_DIR}/clang -O0 -S -emit-llvm -fsoftboundcets ${TEST_FILE} -o ${RESULT_DIR}/${TEST_NAME}_CETS.ll
${LLVM_DIR}/clang -O0 -fsoftboundcets ${TEST_FILE} -o ${RESULT_DIR}/${TEST_NAME}_CETS.bin -L ${SOFTBOUNDCETS_DIR} -lm -lrt

# Create SVFGs
#wpa -nander -svfg -dump-vfg ${RESULT_DIR}/${TEST_NAME}_no_CETS.ll
#mv svfg_final.dot ${RESULT_DIR}/${TEST_NAME}_no_CETS_svfg.dot
#wpa -nander -svfg -dump-vfg ${RESULT_DIR}/${TEST_NAME}_CETS.ll
#mv svfg_final.dot ${RESULT_DIR}/${TEST_NAME}_CETS_svfg.dot

# Execute binaries
echo
echo ============================================================
echo Execute binary without CETS:
./${RESULT_DIR}/${TEST_NAME}_no_CETS.bin

echo
echo ============================================================
echo Execute binary with CETS:
./${RESULT_DIR}/${TEST_NAME}_CETS.bin
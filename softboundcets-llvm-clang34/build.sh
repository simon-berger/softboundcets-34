#!/bin/sh

# Get script directory
if [ -L $0 ] ; then
    SCRIPT_DIR=$(dirname $(readlink -f $0)) ;
else
    SCRIPT_DIR=$(dirname $0) ;
fi ;

# Set dirs
BUILD_DIR=${SCRIPT_DIR}/build

# Build llvm
if [ ! -d "${BUILD_DIR}" ]; then
  mkdir ${BUILD_DIR}
  cd ${BUILD_DIR}
  ./../configure --enable-optimized --prefix=/home/simon/Dokumente/Masterarbeit_Lokal/softboundcets-34/softboundcets-llvm-clang34/build
  make -j4
else
  cd ${BUILD_DIR}
  make update
fi
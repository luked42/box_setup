#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname $(realpath ${0}))
WORKING_DIR=${BASE_DIR}/working
LLVM_DIR=${PREFIX_DIR}/llvm

mkdir ${WORKING_DIR}
mkdir -p ${LLVM_DIR}

pushd ${WORKING_DIR}

git clone https://github.com/llvm/llvm-project.git

popd

mkdir -p ${LLVM_DIR}

pushd ${LLVM_DIR}

cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_INSTALL_PREFIX=${PREFIX_DIR} -DCMAKE_C_COMPILER=/opt/rh/devtoolset-8/root/usr/bin/gcc -DCMAKE_CXX_COMPILER=/opt/rh/devtoolset-8/root/usr/bin/g++ ${WORKING_DIR}/llvm-project/llvm
cmake --build . --target install

popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

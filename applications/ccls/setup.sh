#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname ${0})
WORKING_DIR=${BASE_DIR}/working
LLVM_DIR=${PREFIX_DIR}/llvm

mkdir ${WORKING_DIR}

pushd ${WORKING_DIR}
git clone --depth=1 --recursive https://github.com/MaskRay/ccls

pushd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=${LLVM_DIR}
cmake --build Release


# Copy the ccls binary to the prefix path
cp Release/bin/ccls ${PREFIX_DIR}/bin
popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

CMAKE_VERSION='3.15.7'
CMAKE_NAME="cmake-${CMAKE_VERSION}"
BASE_DIR=$(dirname $(realpath ${0}))
WORKING_DIR=${BASE_DIR}/working

mkdir ${WORKING_DIR}

wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_NAME}.tar.gz -P ${WORKING_DIR}
tar -xzf ${WORKING_DIR}/${CMAKE_NAME}.tar.gz -C ${WORKING_DIR}/.

pushd ${WORKING_DIR}/${CMAKE_NAME}

./configure --prefix=${PREFIX_DIR}
make && make install

popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

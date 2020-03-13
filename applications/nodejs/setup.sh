#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname ${0})
WORKING_DIR=${BASE_DIR}/working
# FROM https://nodejs.org/download/release/v13.0.0/node-v13.0.0.tar.gz
NODE_VERSION='13.0.0'

mkdir ${WORKING_DIR}

tar -xf node-v${NODE_VERSION}.tar.gz -C ${WORKING_DIR}/.
pushd ${WORKING_DIR}


pushd node-v${NODE_VERSION}

export LDFLAGS='-lrt'
./configure --prefix=${PREFIX_DIR}

make && make install

popd

popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

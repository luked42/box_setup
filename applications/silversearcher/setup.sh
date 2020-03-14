#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname ${0})
WORKING_DIR=${BASE_DIR}/working

mkdir ${WORKING_DIR}
pushd ${WORKING_DIR}

wget https://github.com/ggreer/the_silver_searcher/archive/2.2.0.tar.gz
tar -xzf 2.2.0.tar.gz

# Setup libevent
pushd 'the_silver_searcher-2.2.0'

./autogen.sh
./configure --prefix=${PREFIX_DIR} && make && make install

popd
popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname ${0})
WORKING_DIR=${BASE_DIR}/working

mkdir ${WORKING_DIR}
pushd ${WORKING_DIR}

git clone https://github.com/Z3Prover/z3.git

pushd z3

./configure --prefix=${PREFIX_DIR}

pushd build

make && make install

popd

popd

popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

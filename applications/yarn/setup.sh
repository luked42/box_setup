#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname ${0})
WORKING_DIR=${BASE_DIR}/working

YARN_VERSION='1.22.4'

mkdir ${WORKING_DIR}

tar -xf "yarn-v${YARN_VERSION}.tar.gz" -C ${WORKING_DIR}/.
cp -r ${WORKING_DIR}/yarn-v${YARN_VERSION}/bin/* ${PREFIX_DIR}/bin/.
cp -r ${WORKING_DIR}/yarn-v${YARN_VERSION}/lib/* ${PREFIX_DIR}/lib/.

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

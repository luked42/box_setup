#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname $(realpath ${0}))
WORKING_DIR=${BASE_DIR}/working
# FROM https://nodejs.org/download/release/
NODE_NAME='node-v13.0.0-linux-x64'

mkdir -p ${WORKING_DIR}

tar -xf ${BASE_DIR}/${NODE_NAME}.tar.gz -C ${WORKING_DIR}/.

pushd ${WORKING_DIR}

for folder in bin include lib share; do
	mkdir -p ${PREFIX_DIR}/${folder}
	cp -r ${WORKING_DIR}/${NODE_NAME}/${folder}/* ${PREFIX_DIR}/${folder}/.
done


popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname ${0})
WORKING_DIR=${BASE_DIR}/working

mkdir ${WORKING_DIR}

pushd ${WORKING_DIR}

wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage

chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
for dir in bin man share; do
	mkdir -p ${PREFIX_DIR}/${dir}
	cp -r ./squashfs-root/usr/${dir}/* ${PREFIX_DIR}/${dir}/.
done

popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

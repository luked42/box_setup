#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

LIBEVENT_NAME="libevent-2.1.11-stable"
NCURSES_NAME="ncurses-6.2"

BASE_DIR=$(dirname ${0})
WORKING_DIR=${BASE_DIR}/working

mkdir ${WORKING_DIR}

tar -xzf ${BASE_DIR}/${LIBEVENT_NAME}.tar.gz -C ${WORKING_DIR}/.
tar -xzf ${BASE_DIR}/${NCURSES_NAME}.tar.gz -C ${WORKING_DIR}/.

pushd ${WORKING_DIR}

# Setup libevent
pushd ${LIBEVENT_NAME}

./configure --prefix=${PREFIX_DIR} && make && make install

popd

# Setup ncurses
pushd ${NCURSES_NAME}

./configure --prefix=${PREFIX_DIR} && make && make install

popd

git clone --branch 3.0 https://github.com/tmux/tmux.git

# Setup tmux
pushd tmux

./autogen.sh

./configure --prefix=${PREFIX_DIR} CFLAGS="-I${PREFIX_DIR}/include -I${PREFIX_DIR}/include/ncurses" LDFLAGS="-L${PREFIX_DIR}/lib"
make && make install

popd

popd

if [[ -n ${WORKING_DIR} ]]; then
	rm -rf ${WORKING_DIR}
fi

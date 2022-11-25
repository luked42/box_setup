#!/bin/bash -ex

PREFIX_DIR=$1
if [[ -z $PREFIX_DIR ]]; then
	PREFIX_DIR="${HOME}/.local"
fi

BASE_DIR=$(dirname ${0})

# copy to home directory
for dot_file in .bashrc .tmux.conf .clang-format; do
	cp ${BASE_DIR}/${dot_file} ${HOME}/.
done

mkdir -p ${HOME}/.config/extra_dots
mkdir -p ${HOME}/.config/nvim
cp ${BASE_DIR}/init.vim ${HOME}/.config/nvim/.
sed "s#CCLS_CACHE_DIR#${PREFIX_DIR}/ccls#" ${BASE_DIR}/coc-settings.json > ${HOME}/.config/nvim/coc-settings.json

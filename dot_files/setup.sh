#!/bin/bash -ex

BASE_DIR=$(dirname ${0})

# copy to home directory
for dot_file in .bashrc .tmux.conf; do
	cp ${BASE_DIR}/${dot_file} ${HOME}/.
done

mkdir -p ${HOME}/.config/nvim
cp ${BASE_DIR}/init.vim ${HOME}/.config/nvim/.
cp ${BASE_DIR}/coc-settings.json ${HOME}/.config/nvim/.

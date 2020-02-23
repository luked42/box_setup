#!/bin/bash -ex

BASE_DIR=$(dirname ${0})

# copy to home directory
for dot_file in .bashrc .tmux.conf; do
	cp ${BASE_DIR}/${dot_file} ${HOME}/.
done

cp ${BASE_DIR}/init.vim ${HOME}/.config/nvim/.

#!/bin/bash -ex

BASE_DIR=$(dirname ${0})

VIM_PLUG_DIR="${HOME}/.local/share/nvim/site/autoload/"

mkdir -p ${VIM_PLUG_DIR}
cp ${BASE_DIR}/plug.vim ${VIM_PLUG_DIR}/.

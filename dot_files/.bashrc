
export PREFIX_DIR=${HOME}/.local
export PATH=${PREFIX_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PREFIX_DIR}/lib

if [[ -f /opt/rh/devtoolset-7/enable ]]; then
	source /opt/rh/devtoolset-7/enable
fi

if [[ -f ${HOME}/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh ]]; then
	source ${HOME}/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh
fi

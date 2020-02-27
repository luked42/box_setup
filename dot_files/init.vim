:let mapleader = "\<Space>"

let $VIMRUNTIME='${HOME}/.local/share/nvim/runtime'

call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()


" FZF
nnoremap <leader>ff :FZF<CR>


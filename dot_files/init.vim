:let mapleader = "\<Space>"

call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()


" FZF
nnoremap <leader>ff :FZF<CR>


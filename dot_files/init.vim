let mapleader = "\<Space>"

let $VIMRUNTIME='${HOME}/.local/share/nvim/runtime'

imap jj <Esc>

" Configure netrw explorer style
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" COC.NVIM configuration
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set list

set number
set relativenumber

call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'

call plug#end()


" FZF
nnoremap <leader>ff :FZF<CR>

" Set Colorscheme. Must be done after Plugs
colorscheme gruvbox

set cursorline
highlight CursorLine  ctermbg=234

set colorcolumn=120
highlight ColorColumn ctermbg=52

augroup file_formatting
	autocmd!
	autocmd FileType cpp,vim,sh,make,cmake setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END

noremap <Space> <Nop>
let mapleader = "\<Space>"

let $VIMRUNTIME='${HOME}/.local/share/nvim/runtime'

inoremap jj <Esc>

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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
Plug 'rking/ag.vim'
Plug 'easymotion/vim-easymotion'

call plug#end()

" EasyMotion
map <Leader> <Plug>(easymotion-prefix)

" FZF
nnoremap <leader>ff :FZF<CR>

nnoremap <leader>ag :Ag<Space>

" Set Colorscheme. Must be done after Plugs
colorscheme gruvbox

set incsearch
set ignorecase
set smartcase

set cursorline
highlight CursorLine  ctermbg=234

set colorcolumn=120
highlight ColorColumn ctermbg=52

highlight CocHighlightText ctermbg=244

set statusline=%f\ \-\ %y%=%l:%c/%L

augroup file_formatting
	autocmd!
	autocmd FileType cpp,vim,sh,make,cmake setlocal tabstop=4 shiftwidth=4 noexpandtab
	autocmd FileType xml setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

set autoindent
set cindent

" View with :help cino
set cino=l1
set cino+=,g0    " Set scope declartion incline with brace
set cino+=,N-s   " No indent inside namespace
set cino+=,E-s   " No indent inside C-Extern
set cino+=+8     " Continuation lines indent

" Don't create swap files
set noswapfile 

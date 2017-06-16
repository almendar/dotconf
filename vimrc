call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'dracula/vim'
Plug 'derekwyatt/vim-scala'
Plug 'morhetz/gruvbox'
call plug#end()

set nocompatible
filetype off       "required
set wildmenu
set wildmode=longest:full,full
"set completeopt+=longest
set incsearch
set autoread
" Highlight the cursor line
set cursorline
set hlsearch
set showcmd
set number
set hidden

set gfn=Monaco:h12

" Always show window statuses, even if there's only one.
set laststatus=2

set ruler

let g:mapleader = "\<Space>"

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
"let base16colorspace=256
set background=dark
colorscheme gruvbox

let g:netrw_banner = 0
let g:rainbow_active = 1

if has('gui_running')
  set macligatures
  set guifont=Fira_Code:h14
endif

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  filetype plugin indent on
endif

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
set showcmd

map <Leader>n :NERDTreeToggle<CR>


map <silent> <Leader>p :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'build.sbt']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

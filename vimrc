"""""""""""""""""""""""""""""""""""""""""
"  => Vundle setup
"""""""""""""""""""""""""""""""""""""""""
let base16colorspace=256
set nocompatible    " be iMproved, required for Vundle
filetype off " load filetype-specif indent files        " required for Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
source ~/.config/vim/plugins/fugitive.vim
source ~/.config/vim/plugins/vim-surround.vim
source ~/.config/vim/plugins/floaterm.vim
source ~/.config/vim/plugins/vim-test.vim
source ~/.config/vim/plugins/coc.vim
source ~/.config/vim/plugins/dracula.vim
source ~/.config/vim/plugins/fzf.vim
"Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-markdown'
"Plugin 'tpope/vim-speeddating'
"Plugin 'editorconfig/editorconfig-vim'
"Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'nvim-lua/plenary.nvim'
"Plugin 'nvim-telescope/telescope.nvim'
"Plugin 'nvim-lua/popup.nvim'
"Plugin 'nvim-telescope/telescope-fzy-native.nvim'
"Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
""Plugin 'sjl/gundo'
"Plugin 'jceb/vim-orgmode'
"Plugin 'dracula/vim', { 'name': 'dracula' }
call vundle#end()   " required
filetype plugin indent on " load filetype-specif indent files

"""""""""""""""""""""""""""""""""""""""""
"""" Basic settings
"""""""""""""""""""""""""""""""""""""""""
set noswapfile
" FOrce myself not to use the Arrow keys!
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap Y y$
nnoremap <leader>p "+p
vnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

colorscheme dracula
set number " show line numbers
set relativenumber " show line numbers
set showmatch " highlight matching [{()}]
set backspace=indent,eol,start
set cursorline " Highlight current line
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set lazyredraw " redraw only when necessary
set list
set listchars=tab:➤\ ,trail:·
set showcmd " show command in bottom bar
syntax enable " enable syntax processing

" Change mapleader
let mapleader=" "
let maplocalleader=" "

" " Local dirs
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps

map <leader>pv :Ex<CR>
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set laststatus=2 " Always show status line
set magic " Enable extended regexes.
set scrolloff=3 " Start scrolling three lines before horizontal border of window.

"""""""""""""""""""""""""""""""""""""""""
"""" Search settings
"""""""""""""""""""""""""""""""""""""""""
set incsearch " search as characters are typed
set hlsearch " hilight matches

"""""""""""""""""""""""""""""""""""""""""
"""" Format settings
"""""""""""""""""""""""""""""""""""""""""
" 2 spaces = <TAB>
"set autoindent " Copy indent from last line when starting new line.
"set shiftwidth=2 " The # of spaces for indenting.
"set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
"set tabstop=2
"set softtabstop=2 " Tab key results in 2 spaces
"set expandtab
"setlocal colorcolumn=80
" set title " Show the filename in the window titlebar.
" set ttyfast " Send more characters at a given time.
" set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
" set wildmode=list:longest " Complete only until point of ambiguity.

set textwidth=79
" set formatoptions=qrn1

"""""""""""""""""""""""""""""""""""""""""
"""" Folding
"""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldlevelstart=10 " anything with less than 10 levels of nesting will be open
set foldnestmax=10 "10 nested folds max

" space open/closes fold
nnoremap - za
set foldmethod=indent " fold based on indent level

"""""""""""""""""""""""""""""""""""""""""
"""" => Key bindings
"""""""""""""""""""""""""""""""""""""""""
map gf :edit <cfile><cr>
inoremap jj <esc>

imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" nnoremap <leader>w
nnoremap <C-\> <Esc>0i"<Esc>

" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap J 5j
nnoremap K 5k

" remap pane switching
map <silent> <S-Left> <C-w><
map <silent> <S-Down> <C-W>-
map <silent> <S-Up> <C-W>+
map <silent> <S-Right> <C-w>>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" highlight last inserted text
nnoremap gV `[v`]
nnoremap <leader>, :nohlsearch<CR> " turn off search hilight

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e! ~/.vimrc<CR>
nnoremap <leader>ez :e! ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>sz :source ~/.zshrc<CR>
nmap <leader>en :edit ~/.config/nvim/init.vim<cr>
nmap <leader>sn :source ~/.config/nvim/init.vim<cr>
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" " Fix page up and down
" map <PageUp> <C-U>
" map <PageDown> <C-D>
set shell=/bin/bash

"""""""""""""""""""""""""""""""""""""""""
" Templates
"""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  augroup templates
    autocmd BufNewFile meeting* 0r ~/.vim/templates/meeting.md
  augroup END
endif

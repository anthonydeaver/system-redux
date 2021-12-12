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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-markdown'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'voldikss/vim-floaterm'
Plugin 'kien/ctrlp.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'neoclide/coc.nvim', {'branch': 'master'}
Plugin 'antoinemadec/coc-fzf'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-sensible'
Plugin 'sjl/gundo'
Plugin 'dracula/vim', { 'name': 'dracula' }

call vundle#end()   " required
filetype indent on " load filetype-specif indent files

"""""""""""""""""""""""""""""""""""""""""
"""" Basic settings
"""""""""""""""""""""""""""""""""""""""""
set number " show line numbers
set showmatch " highlight matching [{()}]
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set cursorline " Highlight current line
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set lazyredraw " redraw only when necessary
set list
set listchars=tab:➤\ ,trail:·
set showcmd " show command in bottom bar
syntax enable " enable syntax processing
"colorscheme molokai " colorscheme (duh)

" Change mapleader
let mapleader=","

" " Local dirs
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps

set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set laststatus=2 " Always show status line
set magic " Enable extended regexes.
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shiftwidth=2 " The # of spaces for indenting.
" set esckeys " Allow cursor keys in insert mode.
" set diffopt=filler " Add vertical spaces to keep right and left aligned
" set encoding=utf-8 nobomb " BOM often causes trouble
" set nocompatible " Make vim more useful
" set noerrorbells " Disable error bells.
" set nostartofline
" set shortmess=I " Don't show the intro message when starting vim.
" set showmode " Show the current mode.
" set showtabline=2 " Always show tab bar.

"""""""""""""""""""""""""""""""""""""""""
"""" Search settings
"""""""""""""""""""""""""""""""""""""""""
set incsearch " search as characters are typed
set hlsearch " hilight matches

"""""""""""""""""""""""""""""""""""""""""
"""" Tab settings
"""""""""""""""""""""""""""""""""""""""""
" 2 spaces = <TAB>
set tabstop=2
set softtabstop=2 " Tab key results in 2 spaces
set expandtab

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
nnoremap <space> za
set foldmethod=indent " fold based on indent level

"""""""""""""""""""""""""""""""""""""""""
"""" => Key bindings
"""""""""""""""""""""""""""""""""""""""""
map gf :edit <cfile><cr>
inoremap jj <esc>

imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>
" nnoremap <leader>w
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap J 5j
nnoremap K 5k

" remap pane switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" highlight last inserted text
nnoremap gV `[v`]
nnoremap <leader><space> :nohlsearch<CR> " turn off search hilight

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e! $MYVIMRC<CR>
nnoremap <leader>ez :e! ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>svz:source ~/.zshrc<CR>


" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" " Fix page up and down
" map <PageUp> <C-U>
" map <PageDown> <C-D>
set shell=/bin/bash

source ~/.config/vim/plugins/coc.vim

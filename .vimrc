"""""""""""""""Vundle setup""""""""""""""""""""""""""""
let base16colorspace=256
set nocompatible    " be iMproved, required for Vundle
filetype off        " required for Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-sensible'

" markdown editing
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'davepagurek/markdown-preview.vim'
Plugin 'drmingdrmer/vim-syntax-markdown'

call vundle#end()   " required
"""""""""""""""Vundle setup end"""""""""""""""""""""""
" Set syntax highlighting options.
" set t_Co=256
set background=light
syntax on
" colorscheme solarized

colorscheme base16-default-dark

set number
set incsearch
set hlsearch

" Change mapleader
let mapleader=","

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" Set some junk
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
" set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set magic " Enable extended regexes.
set nocompatible " Make vim more useful
set noerrorbells " Disable error bells.
set nostartofline
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shiftwidth=2 " The # of spaces for indenting.
set shortmess=I " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set showtabline=2 " Always show tab bar.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set tabstop=4
set softtabstop=4 " Tab key results in 2 spaces
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.

set textwidth=79
set formatoptions=qrn1

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
map <F2> 0i//<Esc>  
map <F3> 02dw
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>
imap <F2> <Esc>0i//  
imap <F3> <Esc>02dwi

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Emulate bundles, allow plugins to live independantly. Easier to manage.
" call pathogen#runtime_append_all_bundles()

" Markdown
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" CSS3
au BufRead,BufNewFile *.css set ft=css syntax=css

" HTML5
au BufRead,BufNewFile *.html set ft=html syntax=html
au BufRead,BufNewFile *.mustache set ft=html syntax=html

au BufRead,BufNewFile *.js set ft=javascript syntax=javascript
" autocmd BufWritePost *.js JSLint

" Markdown preview config

" Only refresh preview on save (default is every edit, jumps around too much for my liking
let g:mkdp_refresh_on_save = 1

" Use Safari for preview (feel free to change to Chrome)
let g:mkdp_path_to_chrome = "open -a Safari"

" Use <Leader>mm to launch preview, <Leader>mn to close
nmap <silent> <Leader>mm <Plug>MarkdownPreview
nmap <silent> <Leader>mn <Plug>StopMarkdownPreview

" Enable MathJax
let g:vim_markdown_math = 1

" 2 space tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

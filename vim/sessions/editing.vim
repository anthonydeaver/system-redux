let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit .zshrc
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 47 + 31) / 63)
exe 'vert 1resize ' . ((&columns * 180 + 181) / 362)
exe '2resize ' . ((&lines * 47 + 31) / 63)
exe 'vert 2resize ' . ((&columns * 181 + 181) / 362)
exe '3resize ' . ((&lines * 13 + 31) / 63)
argglobal
balt .dotfiles/vimrc
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 39 - ((38 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 39
normal! 0
lcd ~/
wincmd w
argglobal
if bufexists("~/.dotfiles/vimrc") | buffer ~/.dotfiles/vimrc | else | edit ~/.dotfiles/vimrc | endif
if &buftype ==# 'terminal'
  silent file ~/.dotfiles/vimrc
endif
balt ~/.config/nvim/init.vim
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 56 - ((25 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 56
normal! 0
lcd ~/
wincmd w
argglobal
if bufexists("~/.config/nvim/init.vim") | buffer ~/.config/nvim/init.vim | else | edit ~/.config/nvim/init.vim | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/init.vim
endif
balt ~/.config/nvim/init.vim
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 6) / 13)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 05|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 47 + 31) / 63)
exe 'vert 1resize ' . ((&columns * 180 + 181) / 362)
exe '2resize ' . ((&lines * 47 + 31) / 63)
exe 'vert 2resize ' . ((&columns * 181 + 181) / 362)
exe '3resize ' . ((&lines * 13 + 31) / 63)
if exists(':tcd') == 2 | tcd ~/ | endif
tabnext 1
badd +1 ~/.config/nvim/init.vim
badd +56 ~/.dotfiles/vimrc
badd +1 /Users
badd +1 ~/workspaces/devops/percipio-inventory
badd +20 ~/workspaces/devops/percipio-inventory/inventory/app.py
badd +13 ~/.dotfiles/config/vim/plugins/floaterm.vim
badd +0 ~/.zshrc
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

set autoindent " Copy indent from last line when starting new line.
set shiftwidth=4 " The # of spaces for indenting.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set tabstop=4
set softtabstop=4 " Tab key results in 2 spaces
set expandtab
setlocal colorcolumn=80
setlocal path=src/**, tests, bin/**, app/**
setlocal wildignore=*/__pycache__/*,*.pyc

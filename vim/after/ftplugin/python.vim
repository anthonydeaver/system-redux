setlocal autoindent " Copy indent from last line when starting new line.
setlocal shiftwidth=2 " The # of spaces for indenting.
setlocal smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
setlocal tabstop=2
setlocal softtabstop=2 " Tab key results in 2 spaces
setlocal expandtab
setlocal colorcolumn=80
setlocal path=src/**, app/**
setlocal wildignore=*/__pycache__/*,*.pyc
setlocal foldmethod=indent
"setlocal foldtext = substitute(getline(v: foldstart), '\\t', '\ \ \ \ ', 'g')

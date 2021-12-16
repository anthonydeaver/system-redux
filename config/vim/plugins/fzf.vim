Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'stsewd/fzf-checkout.vim'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 }}
let $FZF_DEFAULT_OPTS='--reverse'



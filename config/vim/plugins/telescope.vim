Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-lua/popup.nvim'

" Using Lua functions
nnoremap <leader>tff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>tfg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>tfb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>tgf <cmd>lua require('telescope.builtin').git_files()<cr>


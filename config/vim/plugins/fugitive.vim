Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
" These are the only commands I want to short cut.
" If I need to do something like `git stash pop`
" running <leader>gs pop will suffice.
" This ensures that when I do something like
" reset or anything beyond the basics I have to 
" type it out. Less chance of a typo blowing up my
" entire repo :)
" Also, by having commit, merge, and push split between 
" hands it requires an extra second for my brain to
" catch if I'm about to screw up. In theory.
" gi git commit
" gg git status
" gp git push
" gl git pull
" gc git checkout
" gb git branch
" gs git stash
" ga git add
" gf git fetch
" gm git merge
" gt git tag
nmap <leader>gg :Git <cr>
nmap <leader>gi :Git commit<cr>
nmap <leader>gl :Git pull<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Git branch<cr>
nmap <leader>gc :GBranches<cr>
nmap <leader>gs :Git stash<cr>
nmap <leader>ga :Git add<cr>
nmap <leader>gf :Git fetch<cr>
nmap <leader>gm :Git merge<cr>
nmap <leader>gt :Git tag<cr>
nmap <leader>gj :diffget //3<cr>
nmap <leader>gf :diffget //2<cr>

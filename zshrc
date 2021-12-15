# ==================================
# Antibody
# ==================================
# Load the Antigen plugin manager for zsh.
source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle github
antigen bundle git-flow
antigen bundle vi-mode
antigen bundle kubectl
antigen bundle macos
antigen bundle helm
antigen bundle aws
antigen bundle iterm2
antigen bundle jira
antigen bundle pip
antigen bundle python
#antigen bundle pyenv
antigen bundle pylint
antigen bundle virtualenvwrapper
antigen bundle terraform
antigen bundle screen

# other bundles
antigen bundle zsh-users/zsh-autosuggestions

# This needs to be the last bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme
antigen theme agnoster
#antigen theme anthonydeaver/system-redux/theme/anthony.zsh-theme
#antigen theme https://gist.github.com/anthonydeaver/ff3a3992f89efbcd4e72a113442428c6
#antigen theme https://gist.github.com/anthonydeaver/f5359b4a03d45fd2bbde1ec47e9f3624
antigen apply
alias vim="nvim"
# ==================================
# Config
# ==================================
#ZSH_THEME="anthony"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# Vim mode
bindkey -v
bindkey '^H' backward-kill-word
export KEYTIMEOUT=1
export GIT_EDITOR="vim"

# remove zsh history size limits
# History management settings.
setopt hist_ignore_all_dups
setopt hist_ignore_space

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
HISTIGNORE="exit"
HISTCONTROL=ignoredups:erasedups
setopt EXTENDED_HISTORY
setopt inc_append_history # Update History in all windows on command execution

export EDITOR="vim"

# When I type a directory path, just cd to it.
setopt auto_cd

# Show time taken for the command to finish, if it takes longer than this many seconds.
REPORTTIME=5
# # Path to your oh-my-zsh installation.
# #export ZSH=~/.oh-my-zsh

# # Case sensitive completion must be off. _ and - will be interchangeable.

# # Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# # Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

#export PATH=$(pyenv root)/versions/$(pyenv version-name)/bin:$HOME/scripts:$HOME/.local/bin:$PATH

#path = (
#  $(pyenv root)/versions/$(pyenv version-name)/bin
#  $HOME/scripts
#  $HOME/.local/bin
#  $path
#)
# source $ZSH/oh-my-zsh.sh

# autoload -U promptinit; promptinit
# # set pureshell prompt
# prompt pure
# # aliases
alias vsh='vim ~/.zshrc'
# alias devup="(cd ~/.dotfiles && git pull) && ansible-playbook ~/.dotfiles/local.yml --extra-vars username=$(whoami)"
# alias nethack='telnet nethack.alt.org'

# # Load any unsynchronized local zshrc configurations and settings
# if [ -f ~/.zshrc.local ]; then
#   source ~/.zshrc.local
# fi

#if command -v pyenv 1>/dev/null 2>&1; then
##  eval "$(pyenv init -)"
#  export PYENV_ROOT="$HOME/.pyenv"
#  export PATH="$PYENV_ROOT/bin:$PATH"
#  eval "$(pyenv init -)"
#
#fi
#
#if [ -e "$HOME/.pyenv/versions/$(pyenv version-name)/bin/virtualenvwrapper.sh" ]; then
#  export WORKON_HOME=~/.virtualenvs
#  mkdir -p $WORKON_HOME
#  . ~/.pyenv/versions/3.8.5/bin/virtualenvwrapper.sh
#fi
#
#
#export PATH=$(pyenv root)/versions/$(pyenv version-name)/bin:$HOME/scripts:$HOME/.local/bin:$PATH
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source "${HOME}"/.ktx

# # Parrallelized tar bzip2
# pbzipper() {
#   tar -cv $1 | pbzip2 -m500 > $1.tar.bz2
# }

# ### Backup function for Work Laptop ###
# backupSkillsoft() {
#   pbzipper $1
#   split -b 9000m $1.tar.bz2 "$1.tar.bz2.part."
# }


 kcs () {
         if [ ! -d "${HOME}/.kube" ]
         then
                 echo "echo \"The following directory does not exist: ${HOME}/.kube. Exiting...\""
                 return 1
         fi
         if [ -z "$(ls -A ${HOME}/.kube)" ]
         then
                 echo "echo \"No configs present in ${HOME}/.kube. Exiting...\""
                 return 1
         fi
         if [ -z "$1" ]
         then
                 return 1
         fi
         if [ -z "$1" ]
         then
                 for kube in $(find "${HOME}/.kube" -maxdepth 1 -type f -o -type l)
                 do
                         if [[ "${KUBECONFIG}" == "$kube" ]]
                         then
                                 echo -n "(active) "
                         fi
                         echo $(basename "${kube}")
                 done
                 return
         fi
         if [[ "$1" == "none" ]] || [[ "$1" == "None" ]]
         then
                 unset KUBECONFIG
                 return
         fi
         if [ -e "${HOME}/.kube/${1}" ]
         then
                 export KUBECONFIG="${HOME}/.kube/${1}"
         else
		 echo "echo \"The following file does not exist: ${HOME}/.kube/${1}. Exiting...\""
                return 1
        fi
 }

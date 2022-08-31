export ALIEN_SECTIONS_LEFT=(
  exit
  user
  path
  vcs_branch:async
  vcs_status:async
  vcs_dirty:async
  newline
  ssh
  venv
  prompt
)
#export ALIEN_THEME="bnw"
export ALIEN_CUSTOM_THEME_PATH=~/.dotfiles/themes/alien-gruv.zsh
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
# antigen bundle virtualenvwrapper
antigen bundle terraform
antigen bundle screen
antigen theme eendroroy/alien alien

# other bundles
antigen bundle zsh-users/zsh-autosuggestions

# This needs to be the last bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

alias vi="nvim"
alias vim="nvim"
alias slack="docker run -it -v ~/.config/slack-term/config:/config erroneousboat/slack-term"
alias knet="kubectl run tmp-shell-$(whoami) --rm -i --tty --image nicolaka/netshoot -- /bin/bash"
alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
source $ZSH/oh-my-zsh.sh
  export PATH="/Users/aydeaver/Applications:$PATH"
# ==================================
# Virtualenv
# ==================================
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if [ -e "$HOME/.pyenv/versions/$(pyenv version-name)/bin/virtualenvwrapper.sh" ]; then
  export VIRTUALENVWRAPPER_PYTHON="$HOME/.pyenv/versions/$(pyenv version-name)/bin/python"
  export VIRTUALENVWRAPPER_SCRIPT="$(command \which virtualenvwrapper.sh)"
  export VIRTUAL_ENV_DISABLE_PROMPT=
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/workspaces
  mkdir -p $WORKON_HOME
  . $HOME/.pyenv/versions/$(pyenv version-name)/bin/virtualenvwrapper.sh
fi

# ==================================
# Config
# ==================================
# fix colors in tmux
export TERM="xterm-256color"
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
export ZSH=~/.oh-my-zsh


alias vsh='vim ~/.zshrc'
# alias devup="(cd ~/.dotfiles && git pull) && ansible-playbook ~/.dotfiles/local.yml --extra-vars username=$(whoami)"
# alias nethack='telnet nethack.alt.org'

export PATH=$(pyenv root)/versions/$(pyenv version-name)/bin:$HOME/scripts:$HOME/.local/bin:/usr/local/go/bin:$PATH

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ `uname` == "Darwin" ]]; then
    source $HOME/.dotfiles/mac.zsh
fi

dev () {
         if [ -e "${HOME}/.dotfiles/vim/sessions/${1}.vim" ]
         then
                 vim -S "${HOME}/.dotfiles/vim/sessions/${1}.vim"
         else
		 echo "echo \"There is no session for ${1}\""
                return 1
        fi

}

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/aydeaver/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/aydeaver/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/aydeaver/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/aydeaver/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


. /Users/aydeaver/.asdf/asdf.sh

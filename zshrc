# remove zsh history size limits
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
export EDITOR="/Applications/TextEdit.app/Contents/MacOS/TextEdit"
# Base16 Shell, for coloring asthetic
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
# fix colors in tmux
export TERM="xterm-256color"
# if [ "$TMUX" = "" ]; then tmux -2; fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="anthony"

# Case sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

export PATH=$(pyenv root)/versions/$(pyenv version-name)/bin:$HOME/scripts:$PATH

plugins=(
  git
  vi-mode
  kubectl
  macos
  zsh-syntax-highlighting
  virtualenvwrapper
  terraform
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
# set pureshell prompt
prompt pure

alias devup="(cd ~/.dotfiles && git pull) && ansible-playbook ~/.dotfiles/local.yml --extra-vars username=$(whoami)"
alias nethack='telnet nethack.alt.org'

# Load any unsynchronized local zshrc configurations and settings
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Load taskwarrior aliases and functions
if [ -f ~/.zshrc-taskwarrior ]; then
  source ~/.zshrc-taskwarrior
fi

bindkey '^H' backward-kill-word

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
. ~/.pyenv/versions/3.8.5/bin/virtualenvwrapper.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source "${HOME}"/.ktx

# Parrallelized tar bzip2
pbzipper() {
  tar -cv $1 | pbzip2 -m500 > $1.tar.bz2
}

### Backup function for Work Laptop ###
backupSkillsoft() {
  pbzipper $1
  split -b 9000m $1.tar.bz2 "$1.tar.bz2.part."
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
# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/aydeaver/Dropbox/Anthony/campaign/rockport/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/aydeaver/Dropbox/Anthony/campaign/rockport/node_modules/tabtab/.completions/electron-forge.zsh
export AWS_PROFILE=develop

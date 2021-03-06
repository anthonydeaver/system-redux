# remove zsh history size limits
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

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

ZSH_THEME="philips"

# Case sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

export PATH=$(pyenv root)/versions/$(pyenv version-name)/bin:$PATH

plugins=(
  osx
  zsh-syntax-highlighting
  virtualenvwrapper
  git
  kubectl
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
# set pureshell prompt
prompt pure

alias devup="(cd ~/.dotfiles && git pull) && ansible-playbook ~/.dotfiles/local.yml --extra-vars username=$(whoami)"

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
# Support for bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

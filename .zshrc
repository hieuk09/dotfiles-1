# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hieunguyen/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias be="bundle exec"
alias ber="bundle exec rspec-preloader"
alias kubectl="~/Documents/apps/kubectl"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=~/Documents/applications --caskroom=~/Documents/caskroom"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

. /usr/local/opt/asdf/libexec/asdf.sh

export NVM_DIR="$HOME/.nvm"

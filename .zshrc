# Path to your oh-my-zsh installation.
export ZSH="/Users/hieu.nguyen@kaligo.com/.oh-my-zsh"

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export EDITOR="nvim"
export PATH="/Users/hieu.nguyen@kaligo.com/Documents/executables:$PATH"
export PATH="/Users/hieu.nguyen@kaligo.com/Documents/Apps/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=~/Documents/Apps --caskroom=~/Documents/caskroom"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

export LANG="en_US.UTF-8"


# Load Angular CLI autocompletion.
source <(ng completion script)

# pnpm
export PNPM_HOME="/Users/hieu.nguyen@kaligo.com/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.local/bin/env"

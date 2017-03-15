# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim=/usr/local/Cellar/vim/8.0.0456/bin/vim

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ruby heroku)

source $ZSH/oh-my-zsh.sh

# export TERM=xterm-256color

# bindkey "^R" history-incremental-search-backward

# Customize to your needs...
export EC2_HOME=~/.ec2
export EC2_PRIVATE_KEY=~/.ec2/pk-XUYVOZGS6BUUF76DR3VVA2OTF7FOABVZ.pem
export EC2_CERT=~/.ec2/cert-XUYVOZGS6BUUF76DR3VVA2OTF7FOABVZ.pem
export AWS_ACCESS_KEY_ID=AKIAIGZQPWQTIWGO5VDQ
export AWS_SECRET_ACCESS_KEY=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
export GOPATH=~/go
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$GOPATH/bin:$PATH
export BUNDLER_EDITOR=vim

cdpath=(. $HOME/code $HOME/fun )

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

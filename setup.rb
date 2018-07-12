def install_xcode
  system('xcode-select --install')
end

def install_homebrew
  homebrew_installation = `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`
  eval(homebrew_installation)
end

def install_homebrew_cask
  system('brew tap caskroom/cask')
  system('export HOMEBREW_CASK_OPTS="--appdir=/Applications"')
end

def install_dependencies
  install_homebrew
  install_homebrew_cask
end

def install_necessary_apps
  install_dependencies
  system('brew install git mysql mysql56 redis gcc fzf tmux vim the_silver_searcher reattach-to-user-namespace node nvm heroku')
  system('brew install imagemagick@6 qt@5.5')
  system('brew link imagemagick@6 --force')
  system('brew link qt@5.5 --force')
  system('brew cask install google-chrome skype vlc virtualbox sublime-text java slack starcraft chromium')
  system('brew cask install rowanj-gitx postgres'
end

def install_zsh
  system('curl -L http://install.ohmyz.sh | sh')
end

def install_rvm
  system('curl -sSL https://get.rvm.io | bash -s stable')
end

install_xcode
install_necessary_apps
install_zsh
install_rvm

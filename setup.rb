def install_xcode
  system('xcode-select --install')
end

def install_homebrew
  homebrew_installation = `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`
  eval(homebrew_installation)
end

def install_homebrew_cask
  system('brew tap caskroom/cask')
  system('brew tap homebrew/cask-versions')
  system('export HOMEBREW_CASK_OPTS="--appdir=/Applications"')
end

def install_dependencies
  install_homebrew
  install_homebrew_cask
end

def install_necessary_apps
  install_dependencies
  system('brew install git mysql mysql56 redis gcc fzf tmux vim the_silver_searcher reattach-to-user-namespace node nvm')
  system('brew cask install skype vlc sublime-text java starcraft chromium')
  system('brew cask install rowanj-gitx postgres openemu')
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

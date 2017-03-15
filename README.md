dotfiles-1
==========

backup for my dot files and Vim

==========
Setup Work Station

Install xcode

```shell
xcode-select --install
```

Install Homebrew

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install brew cask

```shell
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
```

Install other necessary apps

```shell
brew install git mysql mysql56 redis gcc fzf tmux vim the_silver_searcher reattach-to-user-namespace
brew install imagemagick@6
brew link imagemagick@6 --force
brew cask install google-chrome skype vlc virtualbox sublime-text java slack
```

Install Oh-my-zsh

```shell
curl -L http://install.ohmyz.sh | sh
```

Install rvm

```shell
curl -sSL https://get.rvm.io | bash -s stable
```

Add Vietnamese input methods, Enable changing input method on login screen (System preferences -> Users -> Login options)

==========
Setup VIM

Clone this repo, then go to the folder, then run

```shell
./restore.sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Open Vim and type `:PlugInstall`

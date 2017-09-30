dotfiles-1
==========

Backup for my dot files and Vim. This also contains setup script for my PC.


Setup Work Station
==========

Download `setup.rb` in this repo. Then run

```shell
ruby setup.rb
```

Install Xcode from AppStore, then run

```shell
sudo xcodebuild -license
```

Add Vietnamese input methods, Enable changing input method on login screen (System preferences -> Users -> Login options)

Setup VIM
==========

Clone this repo, then go to the folder, then run

```shell
./restore.sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Open Vim and type `:PlugInstall`

#! /bin/bash

if [ -e ~/.vim ]; then
  rm -rf ~/.vim
fi

if [ -e ~/.vimrc ]; then
  rm ~/.vimrc
fi

if [ -e ~/.zshrc ]; then
  rm ~/.zshrc
fi

ln -s ~/dotfiles/.vim       ~/.vim
ln -s ~/dotfiles/.vimrc     ~/.vimrc
ln -s ~/dotfiles/.zshrc     ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

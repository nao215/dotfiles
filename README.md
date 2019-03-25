## Install
```
gem install homesick
homesick clone nao215/dotfiles
cd ~
homesick symlink dotfiles
```

#### update

```
homesick pull dotfiles
homesick symlink dotfiles
```


### Zsh

1.install zsh
2.change login shell
3.install oh-my-zsh

### Vim

#### install dein

```
git clone https://github.com/Shougo/dein.vim.git ~/.homesick/repos/dotfiles/home/repos/github.com/Shougo/dein.vim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

sh ./installer.sh ~/.homesick/repos/dotfiles/home/repos/github.com/Shougo/dein.vim

in your vim,
:call dein#install()
:call dein#update()
```

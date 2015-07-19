#!/bin/bash
# Should be run from ~

rm -rf ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
rm .vimrc .gitconfig .bashrc .bash_alias .tmux.conf
ln -s .dotfiles/vim .vim
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/gitconfig .gitconfig
ln -s .dotfiles/bashrc .bashrc
ln -s .dotfiles/bash_alias .bash_alias
ln -s .dotfiles/tmux.conf .tmux.conf
ln -s .dotfiles/git-prompt.sh .git-prompt.sh
ln -s .dotfiles/gitmessage .gitmessage

#!/bin/bash

if [ "$1" == "--noninteractive" ]; then
    INTERACTIVE=0
else
    INTERACTIVE=1
fi

BASH_FILE=~/.bashrc
AUTOGEN_TAG="#AUTOGEN_BY_YF-Tung/Dotfiles,_DO_NOT_EDIT"

# 0. change directory
#cd "$(dirname "$0")"
cd "${0%/*}"

# 1. bashrc
touch $BASH_FILE
sed -i.bak '/#AUTOGEN_BY_YF-Tung\/Dotfiles\,_DO_NOT_EDIT/d' $BASH_FILE
DATE=`date +%Y-%m-%d`
echo "# bashrc config begin, added by YF-Tung/Dotfiles on $DATE  $AUTOGEN_TAG" >> $BASH_FILE
cat src/bashrc_append >> $BASH_FILE
echo "# bashrc config end, added by YF-Tung/Dotfiles on $DATE    $AUTOGEN_TAG" >> $BASH_FILE
mkdir -p ~/.dotfiles
cp src/* ~/.dotfiles
cp -r src/scripts ~/.dotfiles

# 2. dotfiles
DOTFILES=".vimrc .inputrc .gitconfig"
for f in $DOTFILES
do
    echo "Replacing $f"
    cp src/$f ~
done

EMAIL="Yufan.Tung@gmail.com"

if [ "$INTERACTIVE" == "1" ]; then
  echo "Please enter you email address for git config [$EMAIL]"
  read NEW_EMAIL
  if [[ "$NEW_EMAIL" != "" ]]; then
      EMAIL=$NEW_EMAIL
  fi
  echo "Using email $EMAIL"
fi


sed -i.bak "s/EMAIL_HERE/$EMAIL/g" ~/.gitconfig
rm -rf ~/.gitconfig.bak

# 3. Install vim plugin
cd ~
if [ ! -d ".vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# 4. Done
source ~/.bashrc
echo "Successfully installed."


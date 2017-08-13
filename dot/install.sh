#!/bin/bash

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
cp src/bash_prompt ~/.dotfiles
cp src/bash_alias ~/.dotfiles
cp src/bash_path ~/.dotfiles
cp -r src/scripts ~/.dotfiles

# 2. dotfiles
DOTFILES=".vimrc .inputrc .gitconfig"
for f in $DOTFILES
do
    echo "Replacing $f"
    cp src/$f ~
done
echo "Please enter you email address for git config"
read EMAIL
sed -i.bak "s/EMAIL_HERE/$EMAIL/g" ~/.gitconfig
rm -rf ~/.gitconfig.bak

# 3. source .bashrc
source $BASH_FILE

# 4. Done
echo "Successfully installed."

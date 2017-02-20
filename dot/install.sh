#!/bin/bash

BASH_FILE=~/.bashrc
DOTFILES=".vimrc .inputrc"
TARGET_STRING="#AUTOGEN_BY_YF-Tung/Dotfiles,_DO_NOT_EDIT"

# 0. change directory
#cd "$(dirname "$0")"
cd "${0%/*}"

# 1. bashrc
sed -i.bak '/#AUTOGEN_BY_YF-Tung\/Dotfiles\,_DO_NOT_EDIT/d' $BASH_FILE
DATE=`date +%Y-%m-%d`
echo "# bashrc config begin, added by YF-Tung/Dotfiles on $DATE  $TARGET_STRING" >> $BASH_FILE
cat src/bashrc_append >> $BASH_FILE
echo "# bashrc config end, added by YF-Tung/Dotfiles on $DATE    $TARGET_STRING" >> $BASH_FILE
mkdir -p ~/.dotfiles
cp src/bash_prompt ~/.dotfiles
cp src/bash_alias ~/.dotfiles
cp src/bash_path ~/.dotfiles
cp -r src/scripts ~/.dotfiles

# 2. dotfiles
for f in $DOTFILES
do
    cp src/$f ~
done

# 3. source .bashrc
source $BASH_FILE

# 4. Done
echo "Successfully installed."

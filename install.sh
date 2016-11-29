#!/bin/bash

BASH_FILE=~/.bashrc
DOTFILES=".vimrc .inputrc"

# 0. change directory
#cd "$(dirname "$0")"
cd "${0%/*}"

# 1. bashrc
DATE=`date +%Y-%m-%d`
echo "# bashrc config begin, added by YF-Tung/Dotfiles on $DATE" >> $BASH_FILE
cat src/.bashrc.append >> $BASH_FILE
echo "# bashrc config end, added by YF-Tung/Dotfiles on $DATE" >> $BASH_FILE
mkdir -p ~/.dotfiles
cp src/bash_prompt ~/.dotfiles
cp src/bash_alias ~/.dotfiles

# 2. dotfiles
for f in $DOTFILES
do
    cp src/$f ~
done

# 3. source .bashrc
source $BASH_FILE

# 4. Done
echo "Successfully installed."

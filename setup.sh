#!/bin/bash

echo "You can get this script at https://raw.githubusercontent.com/YF-Tung/Dotfiles/master/dot.sh"

# Check command
cmd_list="git vim bash"
for cmd in $cmd_list
do
    cmd_path=$(command -v $cmd)
    if [[ "$?" == "0" ]]
    then
        echo "✅ Found $cmd at $cmd_path"
    else
        echo "❌ Command '$cmd' not found!" && exit 2
    fi
done

# Create a temp dir and delete it whenever exit
temp=`mktemp -d` && cd $temp
trap "rm -rf $temp" EXIT

git clone https://github.com/YF-Tung/Dotfiles.git --depth 1 \
    && cd Dotfiles \
    && make install


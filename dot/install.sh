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
pushd ~
HOME_PATH=$(pwd)
popd
APPEND_STR="source ${HOME_PATH}/.dotfiles/rc   #AUTOGEN_BY_YF-Tung/Dotfiles,_DO_NOT_EDIT"
echo "${APPEND_STR}" >> $BASH_FILE
echo "# bashrc config end, added by YF-Tung/Dotfiles on $DATE    $AUTOGEN_TAG" >> $BASH_FILE
mkdir -p ~/.dotfiles
cp src/* ~/.dotfiles
cp -r src/scripts ~/.dotfiles

# 2. dotfiles
DOTFILES=".vimrc .inputrc .screenrc .gitconfig"
for f in $DOTFILES
do
    echo "Replacing $f"
    cp src/$f ~
done

EMAIL=""
if [ "$INTERACTIVE" == "1" ]; then
  echo "Please enter you email address for git config [$EMAIL]"
  read NEW_EMAIL
  if [[ "$NEW_EMAIL" != "" ]]; then
      EMAIL=$NEW_EMAIL
  fi
  echo "Using email $EMAIL"
fi
if [[ "$EMAIL" != "" ]]; then
    EMAIL="email = $EMAIL"
fi
sed -i.bak "s/EMAIL_HERE/$EMAIL/g" ~/.gitconfig

GIT_VERSION=$(git --version | awk '{print $3}')
GIT_MAJOR_VERSION=${GIT_VERSION::1}
if [ "$GIT_MAJOR_VERSION" -ge "2" ]; then
  GIT_PUSH_DEFAULT_POLICY="simple"
else
  GIT_PUSH_DEFAULT_POLICY="nothing"
fi
sed -i.bak "s/PUSH_DEFAULT_HERE/$GIT_PUSH_DEFAULT_POLICY/g" ~/.gitconfig
rm -rf ~/.gitconfig.bak

# 3. Done
source ~/.bashrc
echo "Successfully installed."


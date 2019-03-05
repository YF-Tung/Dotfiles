# Dotfiles
Set up my productivity environment. In seconds.

[![Build Status](https://travis-ci.org/YF-Tung/Dotfiles.svg?branch=master)](https://travis-ci.org/YF-Tung/Dotfiles)

## Requirements
* bash 4.x

Default bash for macOS is really old. Please update it by the following.
```bash
brew install bash
sudo echo '/usr/local/bin/bash' >> /etc/shells
chsh -s /usr/local/bin/bash
```

## How to install (in bash)
* `curl -L https://bit.ly/2W7rB4G | bash && source ~/.bashrc`
* (Install offline) Paste the content of `setup_offline.sh` into terminal

The link is short for `https://raw.githubusercontent.com/YF-Tung/Dotfiles/master/setup.sh`

## Effects
1. Append .bashrc (will clear any content previously appended by this script)
2. Replace/create .vimrc .inputrc .dotfiles/

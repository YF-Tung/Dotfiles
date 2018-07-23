#!/bin/bash
# Print help
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: $0 [tar_file]"
  exit 1
fi

# Check tar file if provided
if [ "$1" != "" ] && [ ! -f "$1" ]; then
  echo "File \"$1\" not found!"
  exit 1
fi

if [ "$1" != "" ]; then
  tar_file_path=$1
  if [[ "$tar_file_path" != /* ]]; then
    tar_file_path=$(pwd)/$tar_file_path
  fi
fi

# Create a temp dir and delete it whenever exit
temp=`mktemp -d` && cd $temp
trap "rm -rf $temp" EXIT

if [ "$tar_file_path" != "" ]; then
  cp -r "$tar_file_path" dot.tar
else
  TAR_URL=http://YF-Tung.github.io/dot.tar
  # Test before download
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' $TAR_URL)
  if [ $STATUS != "200" ]; then
    echo "Failed to download tar (HTTP response: $STATUS)!"
    exit 1
  fi
  curl -O $TAR_URL
fi
tar xf dot.tar && dot/install.sh -s || echo 'Failed to extract / install!'
cd ..

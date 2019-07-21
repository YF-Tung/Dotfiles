#!/bin/bash

# Create a temp dir and delete it whenever exit
tempDir=`mktemp -d`
trap "rm -rf $tempDir" EXIT

export LC_ALL=zh_TW.UTF-8
export LANG=zh_TW.UTF-8
tar zcf ${tempDir}/dot.tgz dot
bTxt=$(base64 -i ${tempDir}/dot.tgz)

echo "temp=\`mktemp -d\` && pushd \$temp && echo ${bTxt} | base64 --decode > dot.tgz && tar xf dot.tgz && dot/install.sh --noninteractive && source ~/.bashrc && popd && rm -rf \$temp" > setup_offline.sh
chmod +x setup_offline.sh


#!/bin/bash

# Create a temp dir and delete it whenever exit
tempDir=`mktemp -d`
trap "rm -rf $tempDir" EXIT

tar zcf ${tempDir}/dot.tgz dot
bTxt=$(base64 -i ${tempDir}/dot.tgz)

echo "temp=\`mktemp -d\` && cd \$temp && echo ${bTxt} | base64 -D -o dot.tgz && tar xf dot.tgz && dot/install.sh --noninteractive" > setup_offline.sh
chmod +x setup_offline.sh


#!/bin/bash
temp=`mktemp -d`
cp dot.tar ${temp}
cd ${temp}
tar xf dot.tar
dot/install.sh
cd ..
rm -rf $temp


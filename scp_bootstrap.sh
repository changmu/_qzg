#!/bin/bash
set -e

remote_host=
if [ $# != 1 ]; then
    echo need remote_host
    exit 1
else
    remote_host=$1
fi

rm -rf /tmp/.qzg
cp -r $HOME/.qzg /tmp
rm -rf /tmp/.qzg/.git
scp -r /tmp/.qzg ${remote_host}:~
ssh ${remote_host} 'cd .qzg && ./bootstrap.sh local'

#!/bin/bash
# ./scp_bootstrap.sh d c11 t t193 m ol ol93
set -e

if [ $# = 0 ]; then
    echo need remote_host[s]
    exit 1
fi

rm -rf /tmp/.qzg
cp -r $HOME/.qzg /tmp
rm -rf /tmp/.qzg/.git

for remote_host in $@; do
    echo remote_host is [$remote_host]

    # 并发执行代码块
    {
        scp -r /tmp/.qzg ${remote_host}:~
        ssh ${remote_host} 'cd .qzg && ./bootstrap.sh local'
    } &
done

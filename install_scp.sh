#!/bin/bash
# 用于批量给远程机器安装配置
# usage: ./install_scp.sh d c11 t t193 m ol ol93
set -e

if [ $# = 0 ]; then
    echo need remote_host[s]
    exit 1
fi

for remote_host in $@; do
    echo remote_host is [$remote_host]

    # 并发执行代码块
    {
        # 上传
        ssh ${remote_host} 'rm -rf /tmp/_qzg'
        ssh ${remote_host} 'mkdir /tmp/_qzg'
        scp -r .qzg ${remote_host}:/tmp/_qzg
        scp *.sh ${remote_host}:/tmp/_qzg
        # 安装, 注册
        ssh ${remote_host} 'cd /tmp/_qzg && ./install_local.sh'
    } &
done

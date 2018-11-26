#!/bin/bash
# usage: ./bootstrap.sh [local]
# set -x
set -e # 有错误则退出

### 下载配置
if test $# = 0; then
    if [ -d $HOME/.qzg ]; then
        echo "$HOME/.qzg exists."
        exit 0
    fi

    # 配置远程仓库地址
    repo_url='https://github.com/changmu/_qzg.git'

    cd /tmp
    rm -rf _qzg
    git clone $repo_url
    rm -rf _qzg/.git
    mv _qzg $HOME/.qzg
fi

### 安装配置
cd $HOME/.qzg
# 导入函数
source ./function.sh
# 注册配置
RegistConfig 'source $HOME/.qzg/init.sh'


echo "$0 done."

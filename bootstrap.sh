#!/bin/bash
# set -x
set -e # 有错误则退出

repo_url='git@github.com:changmu/_qzg.git'

### 下载配置
if [ -d $HOME/.qzg ]; then
    echo done.
    exit 0
fi

cd /tmp
rm -rf _qzg
git clone $repo_url
rm -rf _qzg/.git
mv _qzg $HOME/.qzg

### 安装配置
cd $HOME/.qzg
# 导入函数
source ./function.sh
# 注册配置
RegistConfig 'source $HOME/.qzg/init.sh'


echo "$0 done."

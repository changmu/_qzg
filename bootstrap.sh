#!/bin/bash
# set -x
set -e # 有错误则退出

### 下载配置
cd /tmp
git clone git@github.com:changmu/.qzg.git
rm -rf .qzg/.git
mv .qzg $HOME

### 安装配置
cd $HOME/.qzg
# 导入函数
source ./function.sh
# 注册配置
RegistConfig 'source $HOME/.qzg/init.sh'


echo "$0 done."

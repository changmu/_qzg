#!/bin/bash
# usage: ./bootstrap.sh [local]
# set -x
set -e # 有错误则退出

# 导入函数
source utils.sh

# 安装
InstallConfig

# 注册
cd $HOME/.qzg # 确保该目录存在
RegistConfig 'source $HOME/.qzg/init.sh'

echo "$0 done."

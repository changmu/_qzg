#!/bin/bash
# usage: ./bootstrap.sh [local]
# set -x
set -e # 有错误则退出

# 导入函数
source common_functions.sh

### 安装配置
InstallConfig
# 注册配置
cd $HOME/.qzg # 确保该目录存在
RegistConfig 'source $HOME/.qzg/init.sh'

echo "$0 done."

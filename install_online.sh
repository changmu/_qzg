#!/bin/bash
# usage: ./online_bootstrap.sh
# set -x
set -e # 有错误则退出

# 导入函数
source utils.sh

### 下载
# 配置远程仓库地址
repo_url='https://github.com/changmu/_qzg.git'
cd /tmp
rm -rf _qzg
git clone $repo_url

# 安装
cd _qzg
InstallConfig

# 注册
RegistConfig 'source $HOME/.qzg/init.sh'

echo "$0 done."

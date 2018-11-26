#!/bin/bash
# set -x
set -e # 有错误则退出

# 配置远程仓库地址
repo_url='https://github.com/changmu/_qzg.git'
my_name=`whoami`
if $my_name = "zhenggang.qiu" || $my_name = "user_00"; then
    repo_url='https://git.yingzhongtong.com/zhenggang.qiu/_qzg.git'
fi
echo repo_url is [$repo_url]

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

#!/bin/bash
# 给新机器安装配置使用
# usage: sh -c "$(curl -fsSL https://raw.githubusercontent.com/changmu/_qzg/master/install_online.sh)"
# set -x
set -e # 有错误则退出


function InstallConfig() {
    echo "installing config ..."
    rm -rf $HOME/.qzg
    cp -r .qzg $HOME/.qzg
}

function RegistConfig() {
    echo "registering config ..."

    # 参数校验
    if test $# != 1; then
        echo "$0: need 1 argument as regist_cmd_str"
        exit 1
    fi

    # 构造注册字符串
    regist_cmd_str=$1

    # 取shell配置名称
    shell_rc_path=$HOME/'.'`basename $SHELL`rc # .bashrc .zshrc
    echo shell_rc_path is [$shell_rc_path]

    # 检查shell配置是否存在
    if [ ! -f $shell_rc_path ]; then
        echo file [$shell_rc_path] not exist.
        exit 1
    else
        echo file [$shell_rc_path] is ok.
    fi

    # 判断shell配置是否已经注册
    result=`grep "$regist_cmd_str" $shell_rc_path` || true
    regist_check=${result:-false}
    echo regist_check is [$regist_check]
    if [ "$regist_check" = false ]; then
        echo registing config...
    else
        echo already registed.
        exit 0
    fi

    # 注册shell配置
    echo "$regist_cmd_str" >> $shell_rc_path

    # 重新加载shell配置
    source $shell_rc_path

    echo regist config done.
}

### 下载
# 配置远程仓库地址
repo_url='https://github.com/changmu/_qzg.git'
cd ~
rm -rf _qzg
git clone $repo_url

# 安装
cd _qzg
InstallConfig

# 注册
RegistConfig 'source $HOME/.qzg/init.sh'
cd ~
rm -rf _qzg
echo "$0 done."

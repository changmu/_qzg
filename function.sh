#!/bin/sh

function RegistConfig() {
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
    echo result is [$result]
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
    echo regist config done.
}

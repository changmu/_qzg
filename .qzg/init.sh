#!/bin/sh

##############################################################################
# env
##############################################################################
export LANG="zh_CN.UTF-8"
export PATH=/bin:$PATH:$HOME/.qzg/tools
# 允许命令行输入git账号
export GIT_TERMINAL_PROMPT=1
# 添加go代理
export GOPROXY=https://goproxy.io
# etcd版本
export ETCDCTL_API=3

##############################################################################
# alias
##############################################################################
alias mkcd='foo(){ mkdir -p "$1"; cd "$1"; }; foo '
alias svi='sudo vim'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias gf='gofmt -w .'
alias gb='go build'
alias ggb='git pull && go build'
alias lb='GOOS=linux GOARCH=amd64 go build'
alias s='ssh'
alias vi='vim'
alias g='git'
alias tf='tail -f'
alias ll='ls -lah'
alias up='git cm -am "auto save and push"; g push'
alias aup='git add .; up'
alias gcm='git pull && cmake .. && make -j4'
alias .q="cd $HOME/.qzg"

##############################################################################
# config
##############################################################################
ulimit -c unlimited
# link if not exist
ln -s $HOME/.qzg/.gitconfig $HOME/.gitconfig &> /dev/null || true
ln -s $HOME/.qzg/.vimrc $HOME/.vimrc &> /dev/null || true
ln -s $HOME/.qzg/.dircolors $HOME/.dircolors &> /dev/null || true


##############################################################################
# tools
##############################################################################
source $HOME/.qzg/z.sh

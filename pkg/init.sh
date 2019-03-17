#!/bin/sh

##############################################################################
# env
##############################################################################
export PATH=/bin:$PATH
# 允许命令行输入git账号
export GIT_TERMINAL_PROMPT=1
# 添加go代理
export GOPROXY=https://goproxy.io
export ETCDCTL_API=3

##############################################################################
# alias
##############################################################################
alias lb='GOOS=linux GOARCH=amd64 go build'
alias work='cd ~/Documents/work/work/'
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

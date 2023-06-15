#!/bin/sh

##############################################################################
# env
##############################################################################
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
export TERM="xterm-256color"
export PATH=/bin:$PATH:$HOME/.qzg/tools
# 允许命令行输入git账号
export GIT_TERMINAL_PROMPT=1
# 添加go代理
export GOPROXY=https://goproxy.cn
#export GOPROXY=https://proxy.golang.com.cn,direct
# etcd版本
export ETCDCTL_API=3
# 如果是linux，则设置提示符颜色
if [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    PS1="\[\e[01;32m\]\u@\h: \W \$\[\e[00m\] "
    export PS1
fi


##############################################################################
# alias
##############################################################################
alias d='docker'
alias mkcd='foo(){ mkdir -p "$1"; cd "$1"; }; foo '
alias svi='sudo vim'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias gf='gofmt -w .'
alias gb='git pull && go build'
alias lb='GOOS=linux GOARCH=amd64 go build'
alias s='ssh'
alias vi='vim'
alias g='git'
alias d='docker'
alias tf='tail -f'
alias ll='ls -lah'
alias up='git cm -am "--other=auto save and push"; g push'
alias aup='git add .; up'
alias gcm='git pull && cmake .. && make -j4'
alias .q="cd $HOME/.qzg"
alias h=hexo
alias n=npm

##############################################################################
# config
##############################################################################
ulimit -c unlimited
# link if not exist
ln -s $HOME/.qzg/.gitconfig $HOME/.gitconfig &> /dev/null || true
ln -s $HOME/.qzg/.vimrc $HOME/.vimrc &> /dev/null || true
ln -s $HOME/.qzg/.dircolors $HOME/.dircolors &> /dev/null || true
ln -s $HOME/.qzg/.tmux.conf $HOME/.tmux.conf &> /dev/null || true

##############################################################################
# tools
##############################################################################
source $HOME/.qzg/z.sh

# 给本地和远程仓库打tag
function gt() {
    if test $# != 1; then
        echo "$0 need tag name"
        return 1
    fi	
    git tag $1;
    git push origin $1;
}

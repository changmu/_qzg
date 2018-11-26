#!/bin/sh

# 导入函数
source $HOME/.qzg/function.sh

##############################################################################
# env
##############################################################################
export BASE_3PARTY_PATH="$HOME/.git/3party"
export BASE_MYAPI_PATH="$HOME/.git/myapi"
export BASE_PROTOLIB_PATH="$HOME/.git/protolib"
export BASE_LOAN_PATH="$HOME/credit_backend"

##############################################################################
# alias
##############################################################################
alias s='ssh'
alias g='git'
alias tf='tail -f'
alias ll='ls -lah'
alias up='git cm -am "auto save and push"; g push'
alias aup='git add .; up'
alias gcm='git pull && cmake .. && make -j4'
alias m="cd $BASE_MYAPI_PATH"
alias p="cd $BASE_PROTOLIB_PATH"
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

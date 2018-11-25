set mouse=a
"set background=dark
set background=light
"colorscheme elflord
set nocompatible " 关闭 vi 兼容模式
syntax on " 自动语法高亮
set virtualedit=onemore "光标可以移动到行尾之后一个字符
set number " 显示行号
" set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set expandtab
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on " 开启插件
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set guifont=consolas
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L\%)\ "设置在状态行显示的信息
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
set ambiwidth=double
endif

set fileformats=unix,dos,mac

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
" 设置字典 ~/.vim/dict/文件的路径
"autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
"autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
"autocmd filetype php set dictionary=$VIMFILES/dict/php.dict

map m1 i#include <cstdio><enter>#include <iostream><Esc>o#include <memory><Esc>o#include <cstring><Esc>o#include <string><Esc>o#include <vector><Esc>o<Enter>using namespace std;<Enter><Esc>oint main()<Enter>{}<Esc>i<Enter><Esc>Oreturn 0;<Esc>O 
map m0 i#include <stdio.h><Esc>o#include <string.h><Enter><Esc>oint main()<Enter>{}<Esc>i<Enter><Esc>Oreturn 0;<Esc>O 
map \b i#!/bin/bash<enter>
map mp oprintf("");<esc>==f"a
map mh i#pragma once<enter>
map  ggdG
map \c gg"+yG
map \v "+p
map \[ ^i// <esc>
map \] ^3x
map <Up> gk
map <Down> gj

ia #b /*************************************************************
ia #e <BS>************************************************************/

autocmd BufReadPost * if line("'\"")>0&&line("'\"")<=line("$") | exe "normal g'\"" | endif 

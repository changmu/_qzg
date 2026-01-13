# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是一个个人开发环境配置管理仓库（_qzg），用于快速在新环境中部署和恢复完整的开发工作配置。支持跨平台部署（Linux/macOS/Windows）。

**仓库地址**: https://github.com/changmu/_qzg.git

## 核心架构

### 配置加载机制

1. Shell启动时执行 `~/.bashrc` 或 `~/.zshrc`
2. 这些文件包含 `source $HOME/.qzg/init.sh`
3. `init.sh` 自动完成：
   - 设置环境变量（LANG, PATH, GOPROXY等）
   - 加载Shell别名和自定义函数
   - 创建符号链接：`.vimrc`, `.gitconfig`, `.tmux.conf`, `.dircolors` -> `~/.qzg/` 对应文件
   - 加载 `z.sh` 目录跳转工具

### 目录结构

```
.qzg/                    # 核心配置目录（被复制到 $HOME/.qzg）
├── init.sh              # 主初始化脚本
├── z.sh                 # 目录快速跳转工具
├── .vimrc               # Vim配置
├── .tmux.conf           # Tmux配置
├── .gitconfig           # Git配置
└── one_time_tools/      # 一次性工具脚本

utils.sh                 # 公用函数库（InstallConfig, RegistConfig）
install_online.sh        # 在线一键安装
install_local.sh         # 本地安装
install_scp.sh           # 批量远程部署
```

## 常用命令

### 部署命令

**在线安装（新机器）：**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/changmu/_qzg/master/install_online.sh)"
```

**本地安装：**
```bash
./install_local.sh
```

**批量远程部署：**
```bash
./install_scp.sh host1 host2 host3
```

### 重新加载配置

```bash
source ~/.bashrc        # 或 source ~/.zshrc
```

### 常用别名

```bash
.q                      # cd $HOME/.qzg（快速进入配置目录）
up                      # git cm -am "debug"; git push
aup                     # git add .; up
gb                      # git pull && go build
lb                      # GOOS=linux GOARCH=amd64 go build
t                       # tmux
g                       # git
d                       # docker
```

### 自定义函数

```bash
gt <tag>                # 给本地和远程仓库打tag
git_push_upstream       # 绑定本地分支到远程
mkcd <dir>              # 创建目录并进入
```

## 开发说明

### 修改配置文件

1. **修改位置**: 直接修改 `$HOME/_qzg/.qzg/` 下的配置文件（不是 `$HOME/.qzg/`，后者是安装后的副本）
2. **测试**: 修改后运行 `./install_local.sh` 重新安装到 `$HOME/.qzg`
3. **生效**: 运行 `source ~/.bashrc` 或重新打开终端
4. **提交**: 在 `$HOME/_qzg` 目录下提交更改

### 添加新脚本

- 工具脚本放入 `.qzg/tools/` 目录（会自动加入PATH）
- 一次性工具放入 `.qzg/one_time_tools/` 目录

### Git提交规范

使用 `.qzg/.tplCommitMsg` 中定义的格式：

```
<type>: <subject> - <modify_description>

type:
  - feature: 新功能
  - bugfix: 修复bug
  - optimize: 性能或体验优化
  - docs: 文档更新
  - style: 格式调整（不改变逻辑）
  - refactor: 代码重构
  - test: 测试用例
```

## 关键环境变量

```bash
LANG="zh_CN.UTF-8"                     # 语言编码
TERM="xterm-256color"                  # 终端类型
PATH=/bin:$PATH:$HOME/.qzg/tools       # 添加自定义工具目录
GOPROXY=https://goproxy.cn,direct      # Go模块代理
ETCDCTL_API=3                          # etcd版本
GIT_TERMINAL_PROMPT=1                  # 允许命令行输入git账号
```

## Tmux快捷键

- **Prefix键**: `Ctrl+A`（非默认的Ctrl+B）
- **r**: 重新加载配置
- **y**: 同步多个窗格输入
- **Ctrl+Q**: 关闭窗口
- **Ctrl+L**: 清空历史
- **Prefix+C**: 创建新窗口并自动分割为4个面板

## 注意事项

1. **符号链接**: 不要直接修改 `~/.vimrc`, `~/.gitconfig` 等，它们是符号链接，应该修改源文件
2. **幂等性**: 安装脚本可以重复执行，不会造成问题
3. **Shell兼容性**: 支持 bash 和 zsh
4. **Git提交**: 禁止添加多余的签名信息（见用户全局配置）
5. 代码提交直接使用master分支，推送远程也是用master分支

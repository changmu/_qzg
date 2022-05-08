### 背景
为了解决以下问题
1. 初始化vim配置
2. 初始化bashrc配置,环境变量,alias等
3. 初始化git配置
4. 存放并迭代常用脚本

## 用法
方法1: 登录新机器执行
```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/changmu/_qzg/master/install_online.sh)"
```
方法2: 批量部署到远端机器
```sh
    ./install_scp.sh host1 host2 ...
```

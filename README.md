这是一个终端配置仓库。
存放常用的alias, config, tools

## 用法
1.登录新机器执行
```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/changmu/_qzg/master/bootstrap.sh)"
```
2.在本地将配置推到远程
```sh
    scp bootstrap.sh remote_host:/tmp && ssh remote_host 'cd /tmp && ./bootstrap.sh'
```

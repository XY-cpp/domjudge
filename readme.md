# domjudge 快速部署

## 修改`cgroup`
修改本机`/etc/default/grub`下的`GRUB_CMDLINE_LINUX_DEFAULT`为：
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash cgroup_enable=memory swapaccount=1 systemd.unified_cgroup_hierarchy=0"
```

保存后重启电脑。

## 启动服务

在目录下输入`sh init.sh`，等待片刻后便可启动服务。

密码保存在`admin_pass`文件中。

## TODO

- [ ] 打印机接口
- [ ] 气球
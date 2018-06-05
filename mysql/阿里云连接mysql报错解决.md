>作者:李忠林
>
>github: https://github.com/Leezhonglin
>
>日期: 2018年5月12日



#### 连接报错2003

#####先检查linux系统的防火墙是否开启

1.查看防火墙运行状态

```
[root@izm5eifctth7468z9e6fz0z ~]# firewall-cmd --state
running
```

2.如果显示running就表示系统防火墙已经开启

这样的话需要给防火墙打开数据库的3306端口

以3306端口为例打开端口的命令为:

```
firewall-cmd --add-port=3306/tcp --permanent --zone=public
```

##### 检查阿里云是否打开数据库对应的端口

登录阿里云官网 ----进入实例—安全组规则 ---入方向—设置如下:

```
授权策略	协议类型	端口范围	授权类型	授权对象	  描述	   优先级	
允许	      自定义       TCP	      3306/3306	  地址段访问	  0.0.0.0/0     1
```



#### navicat连接阿里云服务器报1130错误的解决方法

```
今天使用阿里云服务器，用Navicat连接阿里云服务器，连接过程中报1130错误，

ERROR 1130: Host '192.168.1.3' is not allowed to connect to thisMySQL server 

解决方法： 

1。改表法。可能是你的帐号不允许从远程登陆，只能在localhost。这个时候只要在localhost的那台电脑，登入mysql后，更改"mysql" 数据库里的 "user" 表里的 "host"项，从"localhost"改称"%" 

或者服务器操作熟练地话直接写数据库授权

grant all privileges on 数据库名.* to 用户名@'%' identified by '用户密码';

```


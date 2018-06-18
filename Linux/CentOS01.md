### CentOS笔记

>作者:李忠林
>
>github: https://github.com/Leezhonglin



<<计算机文化>>  —学习计算机基础概念

##### Linux发行版本

```
Redhat Linux 
Ubuntu
CentOS
```

##### macOS软件连接

```
mac
http://xclient.info/?t=cf45be83ba9e7cbc54b5a457f912356b56190ed7
```

##### 阿里云远程登录报错解决办法

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
SHA256:37dpXib6L1tiX7BJUdo+oYFQLlGCllIjWo9n/czvRH8.
Please contact your system administrator.
Add correct host key in /Users/lizhonglin/.ssh/known_hosts to get rid of this message.
Offending RSA key in /Users/lizhonglin/.ssh/known_hosts:2
RSA host key for 47.104.85.246 has changed and you have requested strict checking.
Host key verification failed.

[进程已完成]  
```

>解决方法：
>
>vi ~/.ssh/known_hosts 在本地机器删除对应的密钥信息
>
>
>方法一：
>rm -rf ~/.ssh/known_hosts
>++++++++++++++++++
>优点：干净利索
>缺点：把其他正确的公钥信息也删除，下次链接要全部重新经过认证
>
>方法二：
>vi ~/.ssh/known_hosts
>删除对应ip的相关rsa信息（本例可知删除53行信息即可）
>++++++++++++++++++
>优点：其他正确的公钥信息保留
>缺点：还要vi，还要找到对应信息，稍微优点繁琐
>
>方法三：
>清除旧的公钥信息
>ssh-keygen -R 192.168.0.100
>++++++++++++++++++
>优点：快、稳、狠
>缺点：没有缺点



```
ssh登陆出现警告：
ssh登录，permission denied(publickey.gssapi-with-mic)
用ssh登录Linux，出现permission denied(publickey.gssapi-with-mic.password)错误。
解决方法：
修改/etc/ssh/sshd_config文件，PasswordAuthentication no修改为yes
```

##### 命令 

```shell
www.kernel.org  linux 内核下载地址 -->参考-- minix(教学)  
who /w 		查询哪些用户登录呢系统/ 显示跟详细
clear		清屏
ps 		查看shell版本

adduser 用户名     创建用户
passwd  用户名     创建用户密码 (如果直接回车改当前用户密码/跟上用户名是修改用户名的密码)

whoami /who am i 查看自己是谁

logout /exit   登出账户

shutdown /init 0  	关闭服务器
reboot /init 6   	重启服务器

uname  		查看自己用的什么系统
hostname  	查看主机名
userdel    	删除用户
wall  警告
敲两下tab键 可以查看当前能使用过的命令数

man /info(更详细更专业)   查看命名的使用手册 (按q退出 按h是帮助)
pass --help   获取命令帮助信息
显示太长可以加上|    例如:pass --help |less 
whatis passwd  获取简短帮助
which python    查找命令在哪里
whereis python  查找命令在哪里

pwd 显示当前的目录路径

查看历史命令    history   使用!编号就可以调取
echo  回声命令   
echo $HISTSIZE   查看系统输入的命令历史记录
sodu  以管理员权限做某些事情
ssh 用户名@ip 
scp  安全拷贝


```

##### 实用命令

```
su 切换用户
etc  配置目录
usr  用户目录
home 用户家目录
```

##### 操作文件和文件夹

```shell
touch  创建文件 (如果文件存在会修改文件的最后访问时间)
ls -l   查看长格式
ls -a   查看所有文件
ls      列出所有文件
ls -la  长格式查看全部文件
ls -r   反转顺序
ls -R  递归显示目录

cd abc/foo
cd ../..
cd ~
rm  remove  既可以删文件又可以删除文件
rm -rf / 慎用
```

##### 常用操作命令

```
history   可以查看当天的历史命令(使用!编号就可以把命令在执行一遍)
cp ----copy 复制文件
mv ---move 剪切移动
cat /head/tail 查看文件内容
cat index.html | more/less  分页查看文件内容
head -5 index.html   查看5行内容
tail -2 index.html   查看最后2两行
cat index.html | grep '<div>' 查询文件中指定的内容
grep '<div>' index.html  也可以这样搜索
grep '<div>' index.html -n  查询多少行有这个对应的数据
grep '<div>' / -R -n  & 让命令在后台执行
grep '<div>' / -R -n > result.txt & 命令在后台执行 并且重新执行
grep '<div>' / -R -n > result.txt  2> error.txt &  错误重定向
& 	在后台执行

>	是输出重定向
2> 	执行命令错误了 在行另外一个文件
>> 	追加输出重定向
输入重定向用<

jobs 	可以查看后台有没有任务在执行
fg %1	把任务拿前台来执行
bg %1   在次把任务拿到后台执行
top     查看cpu的占用率
grep 搜文件内容中 
wc  数行数和单词数
uniq 去掉相邻的重复的内容
sort 对内容排序(返回修改后的列表,不改变文件的内容)
diff 版本比较两个文件的内容
file 分析文件的性质(根据文件里面数据的特征值来分析)

find 查找文件 
ctrl+c     终止一个命令的执行
```

##### 远程拷贝文件

```
ssh  用户名@ip 

scp he hellokitty@120.77.222.217:/home/hellokitty/

CentOS:
cat /etc/centos-release  查看操作系统版本
[root@izm5eifctth7468z9e6fz0z ~]# cat /etc/centos-release
CentOS Linux release 7.4.1708 (Core)
[root@izm5eifctth7468z9e6fz0z ~]#
```

##### 创建硬链接/软链接

```
ln filename 目录   创建硬链接

ln -s  /etc/e.txt  filename    创建软连接相当于windows下面的快捷方式.
ln -s ~/guess.py  /usr/bin/guess   创建软链接 
```

##### redis下载地址

```
redis.io
http://download.redis.io/releases/redis-3.2.11.tar.gz
```

##### 下载文件的压缩/解压缩/归档/解归档

```shell
解压缩

后缀为gz的
gzip   文件    压缩
gunzip  文件名      解压文件   -v 可以看见详细的解压过程

后缀为xz的
xz -z
xz -d
xz -z -9  压缩比

解归档
[root@izm5eifctth7468z9e6fz0z ~]# tar -xvf redis-3.2.11.tar

归档
tar -cvf all.tar *  *表示归档当前目录所有文件
tar -xvf all.tar   解归档
```

#####别名 和 反别名

```shell
alias ll= 'ls -l'    定制别名

unalias ll     反别名
```

##### vim使用

 ```
syntax off  关闭高亮语法
syntax no 开启
set ts = 4  设置tap键 为4个空格
修改vim配置文件:
[root@izm5eifctth7468z9e6fz0z ~]# vim .vimrc

!v 可以打开刚才执行过以v开头的在执行一遍
ming

在末行模式下面要执行系统命令可以
! 命令
要回vim  按回车

在末行模式:
:inoremap pymain if __name__ == '__main__':  

命令模式输入
/  可以做搜索    n 向下搜索   N向上搜索


排版
.center() 字符串居中
rjust()  右对齐
ljust()   左对齐
 ```

##### 修改文件权限

```shell
chmod u+x,g+x,O+x 文件   修改文件的权限
chomd 777 读写执行
      744 只读
      766 读写
      555 读执行
          


```

##### 升级python3

```
原文地址:https://blog.csdn.net/jackfrued/article/details/79380979

1.wget  https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz
2.xz -d Python-3.6.5.tar.xz
3.tar -xvf Python-3.6.5.tar
**4.yum install gcc
5.cd Python-3.6.5
6. ./configure --prefix=/usr/local/python36 --enable-optimizations
7. 编译:make && make install   (&&表示执行完前面的命令在执行后面的) 这步错了执行以下
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

8. ln -s /usr/local/python3.6/bin/python3 /usr/bin/python3
```

###### 预习

```shell
NginX   Web服务器
MySQL   关系型数据库  -持久化
Redis   非关系型数据库

防火墙   iptables/firewall

[] -第二大的元素找出来
['','',''] -重复次数排前三的找出来
```

###### pip

```
pip3 install  pycodestyle  python代码规范检查

升级pip:
 [root@izm5eifctth7468z9e6fz0z ~]# pip3 install --upgrade pip
 
 jupyter notebook
 
 
 sys.argv  python接收系统传给的参数包括系统本身
```



#### linux 安装软件



###### 包管理工具

```
yum   yellowdog updater modified
rpm   redhat package  manager
```

###### yum的使用

```
yum list installed  检查安装了哪些软件
 yum search  nginx   看看是否有安装资源
 yum makecache 
```

###### 常用的web架构

```
LAMP   = Linux + Apache + MySQL + PHP
 		 Linux + Nginx + MySQL + Python
```

###### nginx配置

```
iptables -L -n   查看端口状态

nginx:首页位置
 /usr/share/nginx/html.
 
编辑配置文件
 /etc/nginx/nginx.conf.
 
nginx -s stop 停了

启动
nginx

Nginx的启动(start),停止(stop)命令
查看Nginx的版本号：nginx -V

启动Nginx：start nginx

快速停止或关闭Nginx：nginx -s stop

正常停止或关闭Nginx：nginx -s quit
```

###### sftp操作

```shell
命令:sftp root@ip 

lizhonglindeMacBook-Pro:~ lizhonglin$ sftp root@47.104.205.141 
root@47.104.205.141's password: 
Permission denied, please try again.
root@47.104.205.141's password: 
Connected to 47.104.205.141.
sftp> ls
Python-3.6.5        Python-3.6.5.tar    abc                 homework01.py       
homework02.py       homework03.py       homework04.py       homewrok03.py       
in.html             index.html          redis-3.2.11        redis-3.2.11.tar    
two.py              
sftp> cd /usr/share/html
Couldn't stat remote file: No such file or directory
sftp> cd /usr/share/nginx/html
sftp> ls
404.html        50x.html        index.html      nginx-logo.png  poweredby.png   
sftp> get 上传
put 上传

查看进程
ps -ef 
ps -aux 

查看网络状态并且能看见进程号
netstat -nap 

杀进程
kill  进程号

yum配置
 /etc/yum.repos.d/
拷贝其他两个文件
 
修改后用
 yum makecache 
```

###### rpm

```
rpm -ivh   安装   
rpm -e     移除

rpm -qa | grep 包    查询软件是否安装过

rpm -qa | grep jdk | xargs rpm -e  查询后再删除(xargs:前面的搜索结果当成参数使用)
```

###### 安装MySQL

```
Mariadb:
yum install mariadb-server mariadb    安装服务器和客户端

systemctl  start mariadb        7以下低版本的是  service  服务名 start
           stop                         停服务        chkconfig 
           restart
           
systemctl status mariadb   查看服务是否启动

[root@izm5eifctth7468z9e6fz0z ~]# mysql -u root -p  连接mysql

firewall-cmd   --add-port=80/tcp --permanent --zone=public  配置防火墙

设置开机自启:

system enable mariadb    开机自启

system disenble mariadb  取消开机自启
```

###### redis安装

```shell
解压文件

make
make install

redis.conf 先备份到商机目录 原文件不要动

61行 改成自己的内网地址  

80行 port 端口号  可以修改或者不该    6379 merz

480行   require    480 requirepass 密码

redis-server myredis.conf  启动服务
ctrl+c  结束
kill 进程号   没存盘\


在后台运行

redis-server myredis.conf > myredis.log &

jobs  fg %1      %后台编号


[root@izm5eifctth7468z9e6fz0z ~]# redis-server myredis.conf
                _._
           _.-``__ ''-._
      _.-``    `.  `_.  ''-._           Redis 3.2.11 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 11259
  `-._    `-._  `-./  _.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |           http://redis.io
  `-._    `-._`-.__.-'_.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |
  `-._    `-._`-.__.-'_.-'    _.-'
      `-._    `-.__.-'    _.-'
          `-._        _.-'
              `-.__.-'
              
              
连接服务器:

[root@izm5eifctth7468z9e6fz0z ~]# redis-cli -h 172.31.219.49 -p 6379

172.31.219.49:6379> auth 密码
```

###### 免安装的软件

```
1.export  $PATH=         只能一次有效

2.修改环境变量 .bash_profile
3.修改变量别名   .bashrc

4.运行:
python3 -m IPython
```

###### firewall 使用方法

```
centos7下Firewall使用详解
安装它，只需

# yum install firewalld
如果需要图形界面的话，则再安装
# yum install firewall-config

一、介绍

防火墙守护 firewalld 服务引入了一个信任级别的概念来管理与之相关联的连接与接口。它支持 ipv4 与 ipv6，并支持网桥，采用 firewall-cmd (command) 或 firewall-config (gui) 来动态的管理 kernel netfilter 的临时或永久的接口规则，并实时生效而无需重启服务。

Firewall 能将不同的网络连接归类到不同的信任级别，Zone 提供了以下几个级别

drop: 丢弃所有进入的包，而不给出任何响应
block: 拒绝所有外部发起的连接，允许内部发起的连接
public: 允许指定的进入连接
external: 同上，对伪装的进入连接，一般用于路由转发
dmz: 允许受限制的进入连接
work: 允许受信任的计算机被限制的进入连接，类似 workgroup
home: 同上，类似 homegroup
internal: 同上，范围针对所有互联网用户
trusted: 信任所有连接

二、使用方法

# systemctl start firewalld # 启动,
# systemctl enable firewalld # 开机启动
# systemctl stop firewalld # 关闭
# systemctl disable firewalld # 取消开机启动
具体的规则管理，可以使用 firewall-cmd，具体的使用方法可以

$ firewall-cmd --help
1. 查看规则

查看运行状态
$ firewall-cmd --state
查看已被激活的 Zone 信息
$ firewall-cmd --get-active-zones
public
interfaces: eth0 eth1
查看指定接口的 Zone 信息
$ firewall-cmd --get-zone-of-interface=eth0
public
查看指定级别的接口
$ firewall-cmd --zone=public --list-interfaces
eth0
查看指定级别的所有信息，譬如 public
$ firewall-cmd --zone=public --list-all
public (default, active)
interfaces: eth0
sources:
services: dhcpv6-client http ssh
ports:
masquerade: no
forward-ports:
icmp-blocks:
rich rules:
查看所有级别被允许的信息
$ firewall-cmd --get-service
查看重启后所有 Zones 级别中被允许的服务，即永久放行的服务
$ firewall-cmd --get-service --permanent

2. 管理规则

# firewall-cmd --panic-on # 丢弃
# firewall-cmd --panic-off # 取消丢弃
$ firewall-cmd --query-panic # 查看丢弃状态
# firewall-cmd --reload # 更新规则，不重启服务
# firewall-cmd --complete-reload # 更新规则，重启服务
添加某接口至某信任等级，譬如添加 eth0 至 public，再永久生效

# firewall-cmd --zone=public --add-interface=eth0 --permanent
设置 public 为默认的信任级别

# firewall-cmd --set-default-zone=public
a. 管理端口
列出 dmz 级别的被允许的进入端口

# firewall-cmd --zome=dmz --list-ports
允许 tcp 端口 8080 至 dmz 级别

# firewall-cmd --zone=dmz --add-port=8080/tcp
允许某范围的 udp 端口至 public 级别，并永久生效

# firewall-cmd --zome=public --add-port=5060-5059/udp --permanent
b. 管理服务
添加 smtp 服务至 work zone

# firewall-cmd --zone=work --add-service=smtp
移除 work zone 中的 smtp 服务

# firewall-cmd --zone=work --remove-service=smtp
c. 配置 ip 地址伪装
查看

# firewall-cmd --zone=external --query-masquerade
打开伪装

# firewall-cmd --zone=external --add-masquerade
关闭伪装

# firewall-cmd --zone=external --remove-masquerade
d. 端口转发
要打开端口转发，则需要先

# firewall-cmd --zone=external --add-masquerade
然后转发 tcp 22 端口至 3753

# firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=3753
转发 22 端口数据至另一个 ip 的相同端口上

# firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toaddr=192.168.1.100
转发 22 端口数据至另一 ip 的 2055 端口上

# firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=2055:toaddr=192.168.1.100
以上都是一些常用方法，更多高级方法，请参考：
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Security_Guide/sec-Using_Firewalls.html
https://fedoraproject.org/wiki/FirewallD
```

###### jupyter 配置文件链接	

```
/Users/lizhonglin/.jupyter/jupyter_notebook_config.py
```

###### 








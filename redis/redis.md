>作者:李忠林
>
>github: https://github.com/Leezhonglin
>
>日期: 2018年5月9日



##### Rides 使用

---

###### 安装配置

```
解压文件

make
make install

redis.conf 先备份到商机目录 原文件不要动

61行 改成自己的内网地址  

80行 port 端口号  可以修改或者不该    6379 merz  8989

480行   require    480 requirepass 密码

178行   databases 16设置默认启动打开的数据库
redis-server myredis.conf  启动服务
ctrl+c  结束
kill 进程号   会存盘ge
kill -9 进程号  (不要用)


在后台运行
redis-server myredis.conf > myredis.log &

jobs  fg %1      %后台编号   ctrl+c 停进程


启动服务器
[root@izm5eifctth7468z9e6fz0z ~]# redis-server myredis.conf

连接服务器:

[root@izm5eifctth7468z9e6fz0z ~]# redis-cli -h 172.31.219.49 -p 8989

172.31.219.49:6379> auth 密码

连接也可以使用在远程服务上执行命令
如果需要在远程 redis 服务上执行命令，同样我们使用的也是 redis-cli 命令。
$ redis-cli -h host -p port -a password
```

###### 关系数据库搞不定的就需要非关系型数据库

```
属性相差很大
关系型数据库太严谨

NoSQL ----关系型数据库的补充
2008/2010 --- BIg data
nosql = not noly SQL
--- 关系型数据库(锁) 数据价值高强一致性

--- Redis    - 高速缓存                         键值对数据库
--- MongDB   - 存放低价值 结构不严谨的数据        文档数据库
--- Neo4j    - 社交网站 - 图数据库(关联性挖掘)
--- HBase    - 列族数据库
```

###### 服务器基准测试命令:

```
redis-benchmark -h 47.104.205.141 -a 9ijn0okm
```

###### ps -ef |grep redis  查看进程

---

###### redis命令

```
keys *  看到所有的键
keys U*  开头的所有的键
keys [u,p]* u p开头的键

ttl foo 查看生命周期   -2 表示过期了  -1 表示没有生命时间
expire key 时间  设置生命周期
save 保存
bgsave 后台保存
select 1 切换2号数据库
fluahdb  清空单个数据库
flushall  清空所有数据库
shutdown save 关机保存数据
shutdown nosave 关机不保存数据
dbsize  查看所有的键

投票应用:
增加
incr 
incrby
incrbyfloat

减少
decr

strlen()计算值得长度
```

###### 哈希

```
转成对象
hedl 删除字段

```

###### 列表

```
应用场景:
微博应用 发布帖子  消息队列 生成者消费者模式
lrang foo 0 -1  取完
```

###### 集合

```
sinter  交
sunion  并
sdiff   差
```

###### 有序集合

```
应用场景:游戏排位
```

###### 配置 

```
一主三重

1 master ---write
3 

slaveof  ip  port  奴隶机器

info replication    查询奴隶

主从分离 主从复制


哨兵 :sentinel.conf
绑定地址:
```

###### 多开redis

```
多复制几份配置文件 然后修改端口
```






#### centos 7

#### RabbitMQ 能为你做些什么？

消息系统允许软件应用相互连接和扩展．这些应用可以相互链接起来组成一个更大的应用，或者将用户设备和数据进行连接．消息系统通过将消息的发送和接收分离来实现应用程序的异步和解偶．

或许你正在考虑进行数据投递，非阻塞操作或推送通知。或许你想要实现发布／订阅，异步处理，或者工作队列。所有这些都属于消息系统的模式。

RabbitMQ 是一个消息代理 - 一个消息系统的媒介。它可以为你的应用提供一个通用的消息发送和接收平台，并且保证消息再传输过程中的安全。

##### 技术亮点

###### 可靠性

RabbitMQ 提供了多种技术可以让你在性能和可靠性之间进行权衡。这些技术包括持久性、投递确认、发布者证实和高可用性。

###### 灵活的路由

消息在到达队列前是通过交换机进行路由的。RabbitMQ 为典型的路由逻辑提供了多种内置交换机类型。如果你有更复杂的路由需求，可以将这些交换机组合起来使用，甚至你可以写自己的交换机类型，并且当做 RabbitMQ 的插件来使用。

###### 集群

在相同局域网中的多个 RabbitMQ 服务器可以被聚合在一起，作为一个独立的逻辑代理来使用。

###### 联合

对于服务器来说，它比集群需要更多的松散和非可靠链接。为此 RabbitMQ 提供了联合模型。

###### 高可用的队列

在同一个集群中，队列可以被镜像到多个机器中，以确保当其中某些硬件出现事故后，你的消息仍然是安全的。

###### 多协议

RabbitMQ 支持多种消息协议中的消息传递。

###### 广泛的客户端

只要是你能想到的语言几乎都有与其相适配的 RabbitMQ 客户端。

###### 可视化管理工具

RabbitMQ 附带了一个易于使用的可视化管理工具，它可以帮助你监控消息代理的每一个环节。

###### 追踪

如果你的消息系统有异常行为，RabbitMQ 还提供了追踪的支持，让你能够发现问题所在。

###### 插件系统

RabbitMQ 附带了各种各样的插件来对自己进行扩展。甚至你也可以写自己的插件来使用。

还有什么呢...

###### 商业支持

可以提供商业支持，包括培训和咨询。



###### 安装rabbitmq

```
yum install rabbitmq-server
```

######  启动

```
systemctl start rabbitmq-server
```

######  查看状态

```
systemctl status rabbitmq-server
```

###### 停止

```
systemctl stop rabbitmq-server
```

###### 创建用户

```
sudo rabbitmqctl add_user jack 123456
```

###### 创建虚拟主机

```
sudo rabbitmqctl add_vhost myvhost 
```

###### 创建用户标签

```
sudo rabbitmqctl set_user_tags jack mytag
```

######  设置权限

```
sudo rabbitmqctl set_permissions -p myvhost jack "." "." ".*"
```

###### 启动虚拟主机

```
rabbitmqctl list_queues -p myvhost
```

###### 安装celery

```
pip3 install celery -i https://pypi.douban.com/simple
```



###### 运行celery worker （nohup把任务放后台运行）

```
nohup celery -A takk worker --loglevel=info &
```

###### 查看运行状态

```
 ps aux | grep celery
```

###### 任务代码 

```python
import time

from celery import Celery
# 
app=Celery('takk',backend='amqp://jack:123456@localhost:5672/myvhost',broker='amqp://jack:123456@localhost:5672/myvhost')

@app.task
def foo():
    time.sleep(5)
    return 'hello'
```

###### 执行任务

```
>>> from taskk import foo 
>>> result = foo.delay() 
>>> result.ready()
>>> result.get(timeout=1) 
>>> result.status 
>>> result.id
```






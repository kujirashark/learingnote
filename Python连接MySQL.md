#### Python连接MySQL

###### 安装pymysql库

```
pip insatall pymysql
```

```
占位符统一用 %s (表示安全占位符)

%(no)s %(name)s  (命名占位符)
```

###### 连接故障处理

```
cannot connect ....
-host
-port
-服务器没有启动

access denied 
- user
-passwd
-账号不允许远程连接


unknown databese
-db /database 数据库名字写错了

mysql syntax error
-语法错误
```

###### 字符串格式化组装的分享

```
如果使用字符串格式化组装sql语句
最大的风险有被sql注射(SQL Injection)攻击的风险

```

###### 元组和字典拆散

```
元组  *
字典 **
```

###### 事务(transaction/tx)

```
一堆的事情要么全做 要么全部不做   原子性操作(不可分割的操作)
需要手动提交
---------------------
begin;  (开启事务环境)
update tb_account set balance=balance-1000 where accid='1111';
update tb_account set balance=balance+1000 where accid='1122';
commit; (提交)/ rollback;(回滚)
----------------

事务的特点:
 ACID特性
# Atomicity(原子性) :不可分割要么全部成功要么全失败
# Consistency(一致性):事务前后数据状态要保持一致
# Isolation(隔离性): 多个事务不能看到对方的中间状态(提交或者回滚之前的状态)
# Duration(持久性): 事务完成后数据要持久化(事务的影响要反应在物理存储上)

```

###### SQL注射攻击

```mariadb
-- 创建用户表
create table tb_user
(
username varchar(20) not null,
userpass varchar(20) not null
);

-- 插入用户账号
insert into tb_user values ('admin','1q23');
```

###### python代码

```python
import pymysql


def main():
    config ={
        'host' : 'localhost',
        'user' : 'root',
        'passwd' :'123456',
        'db' : 'hrs',
        'charset' : 'utf8',
    }
    #连接数据库
    conn = pymysql.connect(**config)
    try:
        with conn.cursor() as cursor:
            user = input('请输入用户名:')
            passwd = input('请输入密码:')
            #写sql语句尽量不要使用这种方法,容易被SQL注射攻击
            #查询用户名密码是否与数据库匹配
            sql = "select 'x' from tb_user where username='%s' and userpass='%s'" %(user,passwd)
		   #判断是否有内容
            if cursor.execute(sql)>0:
                print('登录成功')
            else:
                print('用户名或密码不正确')
    finally:
        conn.close()

if __name__ == '__main__':
    main()

```

```
请输入用户名:admin
请输入密码:' or '1'='1  或者 a' or '2'>'1   ##就能绕过密码检测登录成功.
登录成功
```

```python
##代码可以改造为这样就能避免SQL注射攻击:
import pymysql


def main():
    config ={
        'host' : 'localhost',
        'user' : 'root',
        'passwd' :'123456',
        'db' : 'hrs',
        'charset' : 'utf8',
        'cursorclass' : pymysql.cursors.DictCursor
    }
    conn = pymysql.connect(**config)
    try:
        with conn.cursor() as cursor:
            user = input('请输入用户名:')
            passwd = input('请输入密码:')
            # sql = 'select "x" from tb_user where username="%s" and userpass="%s"' %(user,passwd)
            # sql = "select 'x' from tb_user where username='%s' and userpass='%s'" %(user,passwd)
            # if cursor.execute(sql)>0:
            #     print('登录成功')
            # else:
            #     print('用户名或密码不正确')
            if cursor.execute(
                    'select 1 from tb_user where username=%s and userpass=%s',(user,passwd)):
                print('登录成功')
            else:
                print('用户名或密码不正确')
    finally:
        conn.close()

if __name__ == '__main__':
    main()


```


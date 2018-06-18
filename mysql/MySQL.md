>作者:李忠林
>
>github: https://github.com/Leezhonglin
>
>日期: 2018年5月5日



####MySQL



---

###### 启动mysql

---

```
windows:

方法一:		启动服务:

		service.msc

找到mysql 57  右键 重启  停止 

方法二: 以管理员身份运行 cmd
 net stop mysql57    停止服务
 net start mysql57   启动服务
 net rstart mysql57  重启服务
 
show databases;   查看数据库
select version();  查看数据库版本
mysql -u root -p  连本机的数据库在输入密码  需要配置环境变量才能连接
```

###### 为什么使用数据库

```
因为我们要做数据持久化  --- 将数据从掉电数据就丢失的存储介质(常见的内存)转移到持久存储介质(最常用的就是硬盘)

数据库:可以高效的存储和管理数据方便的检索数据
```

###### 什么是关系型数据库

```
理论基础 ---集合论和关系代数
特点: 
    用二维表组织数据(表有行和列)
    表--实体
    行--记录
    列--字段
    表与表之间有关系 
    有自己的编程语言 ---SQL--- 结构化查询语言
```

###### 数据库\数据库系统\数据库管理系统

``` 
Datebase ----DB---数据的仓库(集散地)
DBS 	--- 包括了DB\DBMS\DBA(数据库管理员)
(R)DBMS	--- 数据库管理系统  ---数据库管理的软件

	---MySQL---      小巧但是强大  成本低  集群效果好
	---Oracle---     安全强大 能提供商业智能分析    昂贵
 	---IBM DE2---    安全强大 提供商业智能         昂贵
 	---SQL Server--- 
 	---SQLite---     嵌入式数据库(移动端)
```

###### 使用MySQL

```
安装数据库服务器软件和客户端工具
- SQLyog -
- Toad for MySQL -
- Navicat for MySQL-
```

##### linux系统下Mariadb乱码问题

---

###### 由于CentOS7里软件库已经把mysql删除，使用MariaDB代替，所以我们在项目部署的时候也就直接使用了MariaDB。使用MariaDB的关键是要把数据库的编码格式改为UTF-8，不然就会出现中文乱码问题。

###### 首先进入mysql命令行模式键入

```mariadb
mysql -uroot -p
```

###### 输入数据库密码

```mariadb
MariaDB [(none)]> SHOW VARIABLES LIKE 'character_set_%';
```

###### 如果显示如下说明编码有问题

```mariadb
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8                       |
| character_set_connection | utf8                       |
| character_set_database   | latin1                     |
| character_set_filesystem | binary                     |
| character_set_results    | utf8                       |
| character_set_server     | latin1                     |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
8 rows in set (0.00 sec)
```

##### 进入第二步操作修改MariaDB的编码

###### 1. 打开server.cnf文件：

```mariadb
vi /etc/my.cnf.d/server.cnf
```

###### 2. 在server.cnf中[mysqld]添加如下代码

```mariadb
[mysqld]
init_connect='SET collation_connection = utf8_unicode_ci'
init_connect='SET NAMES utf8'
character-set-server=utf8
collation-server=utf8_unicode_ci
skip-character-set-client-handshake
```

###### 3. 打开mysql-clients.cnf文件

```mariadb
vi /etc/my.cnf.d/mysql-clients.cnf
```

###### 4. 在mysql-clients.cnf中[mysql]中添加如下代码

```mariadb
[mysql]
default-character-set=utf8
```

###### 5. 重启MariaDB即可

```mariadb
systemctl restart mariadb
```

```mariadb
若显示内容类似这样：
+--------------------------+----------------------------------------------+
| Variable_name            | Value                                        |
+--------------------------+----------------------------------------------+
| character_set_client     | utf8                                         |
| character_set_connection | utf8                                         |
| character_set_database   | utf8                                         |
| character_set_filesystem | binary                                       |
| character_set_results    | utf8                                         |
| character_set_server     | utf8                                         |
| character_set_system     | utf8                                         |
| character_sets_dir       | /alidata/server/mysql-5.1.73/share/charsets/ |

    则已修改正确，而mysql默认初始设置的都是latin1而非utf8。大功告成..
```



##### 命令操作MySQL

```mariadb
-- SQL(structured query language)
-- 关系型数据库的编程语言
-- DDL (数据定义语言) create (创建)/ drop(删除) / alter (修改)
-- DML (数据操纵语言) insert / delete /update
-- DQL (数据查询语言) select 
-- DCL (数据控制语言) grant / revoke / begin /commit / rollback

-- 如果指定的数据库存在则删除该数据库
drop database if exists school;

-- 创建数据库并指定默认的字符集
create database school  default charset utf8;

-- 切换到school数据库的环境
use school

-- 关系型数据库通过二维表来组织数据
-- 创建学生表
-- not null 非空约束
-- default 1 默认值约束
-- comment '注释的内容'
-- 主键(primary key) -能够标识唯一一条记录的列

-- 建表语句:
create table tb_student 
(
stuid int not null comment '学号', 
sname varchar(10) not null comment '姓名',
ssex bit default 1 comment '性别',
stel char(11) comment '联系电话',
sbirth date comment '出生日期',
primary key(stuid)
);


-- 修改学生表
alter table tb_student add column saddr varchar(100);
-- 修改列
alter table tb_student drop column stel;

-- 插入学生记录
insert into tb_student values (1001,'王大锤',1,'1990-2-12','成都市武侯区');
insert into tb_student (stuid,sname) values (1002,'李四');
insert into tb_student (stuid,sname,ssex) values(1003,'李飘飘',0);
-- 一次性插入多条记录
insert into tb_student values 
(1004,'张师傅',1,'1965-1-20','四川南充'),
(1005,'李浩',1,'1989-04-21','湖南长沙'),
(1006,'王海燕',0,'1945-2-23','重庆');


-- SQL(Structured Query Language): 结构化查询语言(关系型数据库的编程语言)
-- DDL(数据定义语言): create(创建) / drop(删除) / alter(修改)
-- DML(数据操纵语言): insert(插入) / delete(删除) / update(更新) 
-- DQL(数据查询语言): select(选择)
-- DCL(数据控制语言): grant(授予权限) / revoke(召回权限) / begin(开启事务) / commit(提交事务) / rollback(回滚事务)

-- 关系型数据库中数据完整性指的是什么
-- 1. 实体完整性: 每条记录都是独一无二的(主键/唯一约束/唯一索引)
-- 2. 参照完整性: 表中的数据要参照其他表已有的数据(外键)
-- 3. 域完整性: 数据是有效的(数据类型/非空约束/默认值约束/检查约束)

-- 表的设计原则: 范式理论(1NF / 2NF / 3NF / BCNF)
-- 范式级别指的是表设计的规范程度, 范式级别越高规范程度也就越高
-- 范式级别越高在插入/删除/更新数据时可能发生的问题就越少
-- 而且表中的数据冗余度(重复)也就越低
-- 实际开发中往往会降低范式级别来提升查询数据的性能
-- 1NF - 列的属性值不能够再拆分
-- 2NF - 除了主键列之外的列要完全依赖于主键
-- 场景: 不同学院的学生可能有相同的学号
-- 学生表(stuid, sname, ssex, did, dname, dtel)
-- 主键(stuid, did)
-- sname和ssex依赖于stuid, 而dname和dtel依赖于depid
-- 这种依赖是部分依赖而不是完全依赖所以不满足2NF
-- 3NF - 消除传递依赖
-- 场景: 整个学校学生的学号是唯一的
-- 学生表(stuid, sname, ssex, did, dname, dtel)
-- 主键(stuid)



-- 如果指定的数据库存在则删除该数据库
drop database if exists school;
-- 创建数据库并指定默认的字符集
create database school default charset utf8;

-- 切换到school数据库
use school;

-- 关系型数据库通过二维表来组织数据
-- 删除学生表
drop table if exists tb_student;

-- 创建学生表
-- 主键(primary key): 能够标识唯一一条记录的一个或多个列
create table tb_student
(
stuid int not null comment '学号',
sname varchar(10) not null comment '姓名',
ssex bit default 1 comment '性别',
stel char(11) comment '联系电话',
sbirth date comment '出生日期',
primary key (stuid)
);

-- 修改学生表
-- 添加列
alter table tb_student add column saddr varchar(100);
-- 删除列
alter table tb_student drop column stel;

-- 插入学生记录
-- 插入所有列
insert into tb_student values (1001, '王大锤', 1, '1990-2-12', '四川成都');
-- 插入指定列
insert into tb_student (sname, stuid) values ('骆昊', 1002);
insert into tb_student (stuid, sname, ssex) values (1003, '杨飘飘', 0);
-- 一次插入多行
insert into tb_student values 
(1004, '张三丰', 1, '1940-12-3', '湖北武汉'),
(1005, '黄蓉', 0, '1975-3-25', '山东东营'),
(1006, '杨过', 1, '1987-1-19', '湖南长沙');

-- 删除数据
-- delete from tb_student where stuid=1003;

-- 更新数据
-- 通常情况下更新或删除单条数据都是以ID字段(主键)作为条件
update tb_student set sbirth='1980-11-28', saddr='四川德阳' 
where sname='骆昊';
-- update tb_student set saddr='四川绵阳' 
-- where stuid=1004 or stuid=1005 or stuid=1006;
update tb_student set saddr='四川绵阳' 
where stuid in (1004, 1005, 1006);

-- 创建课程表
create table tb_course
(
courseid int not null comment '课程编号',
cname varchar(20) not null comment '课程名称',
ccredit int not null comment '学分',
primary key (courseid)
);

-- 插入课程数据
insert into tb_course (courseid, cname, ccredit) values 
(1111, 'Python程序设计', 4),
(2222, 'HTML程序设计', 2),
(3333, 'Linux操作系统', 1),
(4444, '数据库基础', 1);

-- 创建学生选课表
-- 关系型数据用两种表无法表示实体之间的多对多关联
-- 可以通过中间表来建立学生和课程之间的多对多关系
-- 在实际开发中不建议使用复合主键而且尽可能使用跟业务无关的列做主键
-- int类型的主键可以通过auto_increment设置为自增主键
create table tb_sc
(
scid int not null auto_increment comment '选课编号',
sid int not null comment '学生编号',
cid int not null comment '课程编号',
score float comment '考试成绩',
primary key (scid)
);

-- 添加外键约束
-- 学生选课表中的学生编号参照了学生表的学号
alter table tb_sc add constraint fk_sc_sid 
foreign key (sid) references tb_student (stuid);
-- 学生选课表中的课程编号参照了课程表的课程编号
alter table tb_sc add constraint fk_sc_cid 
foreign key (cid) references tb_course (courseid);

-- 插入学生选课数据
insert into tb_sc (sid, cid, score) values 
(1001, 1111, 90),
(1001, 2222, 80),
(1001, 3333, 70),
(1001, 4444, 60),
(1002, 1111, 60),
(1002, 3333, 95),
(1002, 4444, 68),
(1004, 1111, 55.5),
(1004, 4444, 45.5),
(1005, 1111, 87.5), 
(1005, 3333, 63),
(1005, 4444, 72.5),
(1006, 1111, 78.5),
(1006, 4444, 35);

-- 查询
-- 查询所有学生信息
select * from tb_student;
select * from tb_course;
-- 笛卡尔积
select * from tb_student, tb_course;
-- 投影和别名: 查询所有课程名称及学分
select sname 姓名, ssex 性别 from tb_student;
select sname as 姓名, case ssex when 1 then '男' else '女' end as 性别 from tb_student;
select sname as 姓名, if(ssex, '男', '女') as 性别 from tb_student;
-- 筛选: 查询所有女学生的姓名和出生日期
-- = / <> / > / >= / < / <= / is null / is not null
-- between and / and / or / not
select sname, sbirth from tb_student where ssex=0;
select courseid, cname from tb_course where ccredit>2;
-- 范围筛选: 查询所有80后学生的姓名、性别和出生日期
select sname, ssex, sbirth from tb_student 
where '1980-1-1'<=sbirth and sbirth<='1989-12-31';
select sname, ssex, sbirth from tb_student 
where sbirth between '1980-1-1' and '1989-12-31';
-- 模糊查询: 查询姓杨的学生姓名和性别
-- 通配符(wildcard): % / _
select * from tb_student where sname='杨过';
select * from tb_student where sname like '杨%';
-- 模糊查询: 查询姓杨名字总共两个字的学生的姓名
select * from tb_student where sname like '杨_';
-- 模糊查询: 查询姓杨名字总共三个字的学生的姓名
select * from tb_student where sname like '杨__';
-- 模糊查询: 查询名字中有杨字的学生的姓名(模糊)
select * from tb_student where sname like '%杨%';
-- 多条件和空值处理: 查询没有录入生日或家庭住址的学生姓名
-- 在判断一个列是否为null的时候不能用=或<>而要使用is或者is not
select * from tb_student where sbirth is null or saddr is null;
-- 去重: 查询学生的籍贯
select distinct saddr from tb_student where saddr is not null;
-- 排序: 查询学生的姓名和生日按年龄从大到小排列
-- asc(升序-从小到大) / desc(降序-从大到小)
select sname, sbirth from tb_student where ssex=1 order by sbirth;
select * from tb_student order by ssex asc, sbirth desc;
-- 筛选和排序: 查询所有录入了家庭住址的男学生的姓名、出生日期和家庭住址按年龄从小到大排列
select sname, sbirth, saddr from tb_student 
where saddr is not null and ssex=1
order by sbirth desc;
-- 聚合函数: 查询年龄最大的学生的出生日期
-- max() / min() / sum() / avg() / count()
-- MySQL特有函数: now() / if()
select min(sbirth) from tb_student;
select max(sbirth) from tb_student;
-- 分组查询: 查询男女学生的人数
select count(stuid) from tb_student;
select count(stuid) from tb_student where ssex=1;
-- 经验: 在使用group by分组时如果不希望执行默认的排序操作
-- 可以在分组后使用order by null来避免默认的排序操作提升查询性能
select if(ssex, '男', '女') as 性别, count(*) as 人数 
from tb_student group by ssex order by null;
-- 筛选(where) > 分组(group by) > 筛选(having) > 排序(order by)
select if(ssex, '男', '女') as 性别, count(*) as 人数 
from tb_student 
where saddr is not null 
group by ssex
order by ssex desc;
-- 聚合函数: 查询课程编号为1111的课程的平均成绩
select cid, avg(score) from tb_sc 
where cid=1111;
-- where子句构造的筛选是分组以前的筛选
-- 如果希望对分组以后的数据进行筛选那么要写having子句而不是where子句
select cid, avg(score) as avgScore from tb_sc
group by cid having avgScore<80;
-- 聚合函数: 查询学号为1001的学生所有课程的平均成绩
select sid, avg(score) from tb_sc 
where sid=1001;
-- 分组查询和空值处理: 查询每个学生的学号和平均成绩
select sid, avg(score) from tb_sc 
group by sid having avg(score)<60;
-- 子查询: 查询年龄最大的学生的姓名
select sname, sbirth from tb_student
where sbirth=(select min(sbirth) from tb_student);
-- 子查询: 查询选了两门以上的课程的学生姓名
select sname from tb_student 
where stuid in (
select sid from tb_sc
group by sid having count(sid)>2) and ssex=1;

-- 连接查询
-- 连接查询: 查询学生姓名、所选课程名称和成绩
select sname, cname, score 
from tb_sc, tb_student, tb_course
where sid=stuid and cid=courseid;

-- 连接查询: 查询选课学生的姓名和平均成绩
select sname, avgScore from tb_student t1,
(select sid, avg(score) as avgScore from tb_sc 
group by sid) t2
where stuid=sid;
-- 内连接
select sname, avgScore from tb_student t1
inner join
(select sid, avg(score) as avgScore from tb_sc 
group by sid) t2
on stuid=sid;

-- 左外连接: 查询每个学生的姓名和选课数量
select sname, total from tb_student t1,
(select sid, count(sid) as total from tb_sc 
group by sid) t2
where stuid=sid;
-- where stuid=sid(+);
-- MySQL不支持上面注释掉的左外连接的语法

-- 左外连接: 左表(写在前面的表)不满足连表条件的记录也要查询出来
select sname, ifnull(total, 0) as total from tb_student t1
left outer join
(select sid, count(sid) as total from tb_sc 
group by sid) t2
on stuid=sid;
-- 右外连接: 右表(写在后面的表)不满足连表条件的记录也要查询出来
select sname, ifnull(total, 0) as total from
(select sid, count(sid) as total from tb_sc 
group by sid) t2 right outer join tb_student t1
on stuid=sid;
-- 全外连接: 左右两张表不满足连表条件都要查询出来
-- MySQL不支持使用全外链接(full outer join)

-- 分页查询
select sname, cname, score from tb_sc
inner join tb_student on sid=stuid
inner join tb_course on cid=courseid
-- limit 5;
-- limit 0, 5;
limit 5 offset 0;

select sname, cname, score from tb_sc
inner join tb_student on sid=stuid
inner join tb_course on cid=courseid
-- limit 5;
-- limit 0, 5;
order by score desc
limit 5 offset 0;

-- 创建用户并指定登录口令
create user hellokitty identified by '123123';
alter user hellokitty identified by '1qaz2wsx';
-- 授予权限和召回权限
grant all on school.tb_student to hellokitty;
revoke all on school.tb_student from hellokitty;
grant select on school.tb_student to hellokitty;
grant all on school.* to hellokitty;
grant all on *.* to 'hellokitty'@'%';
revoke all on *.* from hellokitty;
-- 删除用户
drop user hellokitty;
```

###### 查看数据类型

```
MariaDB [(none)]> ? data types;   
```

###### 查看表结构

```
desc tb_student;
```

###### 注意

```
注意:加外键列是加的多的那一边
最好都用外键做关联关系
建立字段的时候可以使用`做区别 
几乎没有删除操作
```

###### 人力资源管理系统数据库

```mariadb
-- 创建人力资源管理系统数据库
drop database if exists HRS;
create database HRS default charset utf8;
-- 切换数据库上下文环境
use HRS;
-- 删除表
drop table if exists TbEmp;
drop table if exists TbDept;
-- 创建部门表
create table TbDept
(
dno int,				  -- 部门编号
dname varchar(10) not null,	-- 部门名称
dloc varchar(20) not null,	-- 部门所在地
primary key (dno)
);
-- 添加部门记录
insert into TbDept values 
(10, '会计部', '北京'),
(20, '研发部', '成都'),
(30, '销售部', '重庆'),
(40, '运维部', '深圳');
-- 创建员工表
create table TbEmp
(
empno int primary key,		-- 员工编号
ename varchar(20) not null,	-- 员工姓名
job varchar(20) not null,	-- 员工职位
mgr int,				   -- 主管编号
sal int not null,		    -- 员工月薪
comm int,				    -- 每月补贴
dno int not null			-- 部门编号
);
-- 添加外键约束
alter table TbEmp add constraint fk_emp_dno foreign key (dno) references TbDept(dno);
-- 添加员工记录
insert low_priority into TbEmp values 
(7800, '张三丰', '总裁', null, 9000, 1200, 20),
(2056, '乔峰', '分析师', 7800, 5000, 1500, 20),
(3088, '李莫愁', '设计师', 2056, 3500, 800, 20),
(3211, '张无忌', '程序员', 2056, 3200, null, 20),
(3233, '丘处机', '程序员', 2056, 3400, null, 20),
(3251, '张翠山', '程序员', 2056, 4000, null, 20),
(5566, '宋远桥', '会计师', 7800, 4000, 1000, 10),
(5234, '郭靖', '出纳', 5566, 2000, null, 10),
(3344, '黄蓉', '销售主管', 7800, 3000, 800, 30),
(1359, '胡一刀', '销售员', 3344, 1800, 200, 30),
(4466, '苗人凤', '销售员', 3344, 2500, null, 30),
(3244, '欧阳锋', '程序员', 3088, 3200, null, 20),
(3577, '杨过', '会计', 5566, 2200, null, 10),
(3588, '朱九真', '会计', 5566, 2500, null, 10);

-- 查询薪资最高的员工姓名和工资(不允许排序不允许使用聚合函数)
-- select ename, sal from tbemp order by sal desc limit 1;
-- select ename, sal from tbemp where sal=(select max(sal) from tbemp);

-- 查询员工的姓名和年薪((月薪+补贴)*13)
select concat(job, ': ', ename) as title, 
			 (sal+ifnull(comm, 0))*13 as annSal 
from tbemp order by annSal desc;

-- 查询有员工的部门的编号和人数
select dno, count(dno) as total from tbemp
group by dno;

-- 查询所有部门的名称和人数
select dname 部门名称, ifnull(total, 0) 总人数 from 
(select dno, count(dno) as total from tbemp
group by dno) t1 right outer join tbdept t2 
on t1.dno=t2.dno;

-- 查询除老板外薪资最高的员工的姓名和工资
select ename, sal from tbemp 
where sal=(
	select max(sal) from tbemp where mgr is not null
);

-- 查询薪水超过平均薪水的员工的姓名和工资
select ename, sal from tbemp 
where sal>(select avg(sal) from tbemp);

select ename, sal, sal-avgSal as delta 
from tbemp t1 inner join 
(select avg(sal) as avgSal from tbemp) t2
on sal>avgSal;

-- 查询薪水超过其所在部门平均薪水的员工的姓名、部门编号和工资
select ename, dname, sal, sal-avgSal as delta from tbemp t1 inner join
(select dno, avg(sal) as avgSal from tbemp group by dno) t2
on t1.dno=t2.dno and sal>avgSal inner join tbdept t3
on t1.dno=t3.dno;

-- 查询部门中薪水最高的人姓名、工资和所在部门名称
select ename,dname,maxsal from tbemp t1
inner join
(select dno,max(sal) as maxsal from tbemp group by dno) t2
on t1.dno=t2.dno and sal=maxsal
inner join tbdept t3
on t2.dno=t3.dno;

-- 查询主管的姓名和职位
select ename, job from tbemp 
where empno in (
	select distinct mgr from tbemp where mgr is not null
);
-- 经验: 尽可能不使用distinct去重和in集合运算
-- SQL优化
-- 想去掉distinct和in运算可以使用exists和not exists操作
select ename, job from tbemp t1
where exists (select 'x' from tbemp t2 where t1.empno=t2.mgr);

-- 查询薪资排名4~6名的员工姓名和工资
select ename, sal from tbemp
order by sal desc
limit 3;
select ename, sal from tbemp
order by sal desc
limit 3, 3;
select ename, sal from tbemp
order by sal desc
limit 6, 3;

```

###### 索引

```
索引相当于一个目录,他可以加速查询提升查询效率
索引是典型的用空间换时间的
```

###### 视图

```
-- 通过视图可以将用户对表的查询权限限制在某些列上
-- 也就是说不同的用户可以看到原始表的不同类的数据
```

###### 存储过程

```
-- 函数和过程: 封装重复操作
-- 函数可以产生返回值而过程没有返回值
-- 函数和存储过程都是存储在数据库服务器端编译好的代码
-- 所以直接调用函数和过程其执行效率比直接向数据库发出SQL语句更高
-- 如果希望简化调用并改善性能就可以考虑使用存储过程

mysql的变量名以@开头
```








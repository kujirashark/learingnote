# 学习笔记（learning note）

个人 Python 全栈方向的学习笔记与实践项目合集，覆盖从 Python 基础语法到 Web 框架（Django / Flask）、数据库（MySQL / Redis / MongoDB）、消息队列（RabbitMQ）、爬虫、前端（HTML / CSS / JavaScript）、Linux 运维与项目部署等完整知识链路。

## 目录导航

| 目录 | 内容说明 |
| --- | --- |
| [python学习笔记/](./python学习笔记/) | Python 基础笔记：`open` 函数参数整理、`os` / `sys` 模块常用函数、阶段练习题（weekPractice.py、works.py）及配套 PDF 笔记 |
| [基础代码/](./基础代码/) | 43 道 Python 基础练习题的独立实现（数字统计、递归、素数、素数菱形打印、Project Euler 类题目等），另含迭代器、生产者消费者、协程爬取豆瓣电影（aiohttp）、连接 MongoDB 等示例脚本 |
| [python面向对象实例/](./python面向对象实例/) | 面向对象入门实例：用类实现"开枪打子弹"小游戏 |
| [django学习笔记/](./django学习笔记/) | Django 框架系统笔记：项目初识、模型查询、表单、模板继承、Cookie/Session、自定义中间件实现登录、虚拟环境与文件上传、Filter 过滤器使用（附截图资源） |
| [Django项目/](./Django项目/) | Django 实战项目与专题笔记：班级管理后台（含 RBAC 权限版 user 应用、序列化器、自定义 Filter、登录中间件）、爱鲜蜂（axf）购物项目资料、`xlwt` 导出 Excel、多条件查询等；[部署/docs](./Django项目/部署/django部署.md) 为 CentOS 下 uwsgi + Nginx 部署图文教程 |
| [flask/](./flask/) | Flask 框架笔记与实战：flask.md 基础笔记（含分页、多对多关系图）、学员管理练习项目（Flask-SQLAlchemy + Cookie）、爱家（ihome/Aj）租房项目（REST 风格 API 文档在 `flask项目/Aj/doc/`）以及 Htai 后台权限项目；[项目部署](./flask/项目部署/Flask项目部署.md) 为 Nginx + uwsgi 部署图文教程 |
| [Student management system project/](./Student%20management%20system%20project/) | Django 学生管理系统完整项目：注册登录、班级/学生增删改查、图片上传，并附带 QQ 邮箱发件（qqmail.py）、FAU 短信（fayouj.py）等辅助脚本 |
| [mysql/](./mysql/) | MySQL 全套笔记：基础 SQL 安装与语法（MySQL.md / 数据库相关.md 的分支整理）、Python 连接 MySQL、`python+mysql` 实现通讯录、阿里云连接 MySQL 报错排查，以及 [主从配置](./mysql/mysql优化/主从配置.md) 等优化专题 |
| [redis/](./redis/redis.md) | Redis 常用数据类型与命令笔记 |
| [Rabbitmq/](./Rabbitmq/centos7.4操作Rabbitmq.md) | CentOS 7.4 环境下 RabbitMQ 的安装与操作笔记 |
| [spider/](./spider/) | 爬虫笔记：Spider.md 爬虫基础、Scrapy 框架使用、MongoDB 常用命令 |
| [docker/](./docker/doker安装.md) | Docker 安装教程 |
| [Linux/](./Linux/) | CentOS 基础命令笔记（CentOS基础.md / CentOS01.md）及"CentOS7 保留自带 Python2 安装 Python3"的 PDF 教程 |
| [html+css/](./html+css/) | HTML + CSS 学习实践页面 |
| [html+css+javasrcipt/](./html+css+javasrcipt/) | HTML + CSS + JavaScript 综合练习：静态网站两套（"网站一 / 网站二"，含全套素材）与课堂点名器小游戏（点名/group5.html） |
| [Machine learning/](./Machine%20learning/) | 机器学习（预留目录，内容待补充） |
| [The interview questions/](./The%20interview%20questions/) | 面试题整理（面试题.pdf） |
| [Git使用指南/](./Git使用指南/) | Git 笔记：git.md 常用命令、git 构建安装、GitHub 生成 SSH 密钥 |
| [Hexo/](./Hexo/Hexo安装教程.md) | Hexo 静态博客框架安装教程 |

## 根目录下的文件

| 文件 | 内容说明 |
| --- | --- |
| [数据库相关.md](./数据库相关.md) | 数据库通识长文（900+ 行）：MySQL 在 Windows 下的安装配置流程、SQL 分类（DDL / DML / DQL 等）、常用操作整理 |
| [ajax写法.md](./ajax写法.md) | jQuery `$.ajax` 与 `$.get` / `$.post` 等常见请求写法示例 |
| python安装编译问题 | Python 安装/编译过程中的问题记录（无扩展名笔记） |
| bookmarks_2018_6_29.html | 浏览器书签备份（2018-06-29 导出） |
| [README.md](./README.md) | 本文件 |

## 建议学习路线

零基础或想系统过一遍知识的读者，可按以下顺序使用本仓库：

1. **Python 基础** → `python学习笔记/` 配合 `基础代码/` 每道练习题动手实现
2. **面向对象** → `python面向对象实例/` + `基础代码/开枪实例1.py`
3. **数据库** → `数据库相关.md` 入门，再进 `mysql/` 深入，配套 `redis/`
4. **Web 初体验** → `html+css/`、`html+css+javasrcipt/`、`ajax写法.md`
5. **框架二选一起步** → `django学习笔记/`（建议）或 `flask/flask.md`
6. **实战练手** → 从 `Student management system project/` 起步，进阶 `Django项目/班级管理后台/`、`flask/flask项目/Aj/`
7. **数据采集与中间件** → `spider/`、`Rabbitmq/`
8. **上线部署** → `Linux/` → `Django项目/部署/` 或 `flask/项目部署/`，容器化参考 `docker/`
9. **查遗补漏** → `The interview questions/` 面试题

## 其他说明

- 项目内静态资源（Bootstrap、jQuery、Swiper 等）为学习用第三方插件，版权归原项目所有。
- 部分目录（如 `Machine learning/`）尚在完善中，欢迎补充笔记。

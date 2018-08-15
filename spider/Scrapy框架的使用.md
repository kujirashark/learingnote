#### Scrapy框架的使用



​	Scrapy是一个为了爬取网站数据，提取结构性数据而编写的应用框架。 可以应用在包括数据挖掘，信息处理或存储历史数据等一系列的程序中。

其最初是为了 [页面抓取](http://en.wikipedia.org/wiki/Screen_scraping) (更确切来说, [网络抓取](http://en.wikipedia.org/wiki/Web_scraping) )所设计的， 也可以应用在获取API所返回的数据(例如 [Amazon Associates Web Services](http://aws.amazon.com/associates/) ) 或者通用的网络爬虫。

本文档将通过介绍Scrapy背后的概念使您对其工作原理有所了解， 并确定Scrapy是否是您所需要的。

当您准备好开始您的项目后，您可以参考 [入门教程](http://scrapy-chs.readthedocs.io/zh_CN/0.24/intro/tutorial.html#intro-tutorial) 。



##### 1. 如何安装scrapy

macos:

```python
pip install  scrapy
```

安装完成后进入虚拟环境后.可以使用`scarpy`命令就能检查是否成功

```python
(venv) lizhonglindeMacBook-Pro:qidianspider lizhonglin$ scrapy
Scrapy 1.5.0 - project: qidianspider

Usage:
  scrapy <command> [options] [args]

Available commands:
  bench         Run quick benchmark test
  check         Check spider contracts
  crawl         Run a spider
  edit          Edit spider
  fetch         Fetch a URL using the Scrapy downloader
  genspider     Generate new spider using pre-defined templates
  list          List available spiders
  parse         Parse URL (using its spider) and print the results
  runspider     Run a self-contained spider (without creating a project)
  settings      Get settings values
  shell         Interactive scraping console
  startproject  Create new project
  version       Print Scrapy version
  view          Open URL in browser, as seen by Scrapy

Use "scrapy <command> -h" to see more info about a command
(venv) lizhonglindeMacBook-Pro:qidianspider lizhonglin$ 

```

看到上面这样的结果就表示我们的`scrapy`已经成功安装了.接下来我们就可以来创建我们的项目了.

创建项目的命令是:

```python
scrapy startproject  qidianspider
```

项目创建成功后有如下的内容:

```python
qidianspider
	qidianspider
		scrapy.cfg
		__init__.py
		items.py
		middlewares.py
		pipelines.py
		settings.py
		spider
			__init__.py
```

这些文件的含义分别是:

* `scrapy.py`: 项目的配置文件
* `qidianspider`: 该项目的python模块
* `qidianspider/items.py`: 项目中的item文件
* `qidianspider/middlewares.py`:
* `qidianspider/piplines.py`:项目中处理数据行为.如:一般结构化的数据持久化
* `qidianspider/settings.py`:项目的设置文件
* `qidianspider/spiders/`: 放置spider代码的目录

##### 2.创建第一个爬虫项目

有了这些我们就可以开始写我们的第一个爬虫了.

在spiders目录下面创建一个`qidian.py`的文件

```python

import scrapy
from scrapy.selector import Selector


class qiDianSpider(scrapy.spiders.Spider):
    # 启动项目指定的name参数
    name = 'qidian'
    # 指定爬取的页面
    start_urls = {
        'https://www.qidian.com/',
    }

    def parse(self,response):
        #print(response)
        # 页面源码
        # print(response.body)
        res = Selector(response)
        # 获取对应的菜单名称
        menu_type =  res.xpath('//*[@id="classify-list"]/dl/dd/a/cite/span/i/text()').extract()
        # 获取对应的菜单连接
        menu_type_href = res.xpath('//*[@id="classify-list"]/dl/dd/a/@href').extract()
        # print(menu_type,menu_type_href)
        return items

```

其包含了一个用于下载的初始URL，如何跟进网页中的链接以及如何分析页面中的内容， 提取生成 [item](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/items.html#topics-items) 的方法。

为了创建一个Spider，您必须继承 [`scrapy.Spider`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/spiders.html#scrapy.spider.Spider) 类， 且定义以下三个属性:

* [`name`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/spiders.html#scrapy.spider.Spider.name): 用于区别Spider。 该名字必须是唯一的，您不可以为不同的Spider设定相同的名字。
* [`start_urls`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/spiders.html#scrapy.spider.Spider.start_urls): 包含了Spider在启动时进行爬取的url列表。 因此，第一个被获取到的页面将是其中之一。 后续的URL则从初始的URL获取到的数据中提取。
* [`parse()`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/spiders.html#scrapy.spider.Spider.parse) 是spider的一个方法。 被调用时，每个初始URL完成下载后生成的 [`Response`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/request-response.html#scrapy.http.Response) 对象将会作为唯一的参数传递给该函数。 该方法负责解析返回的数据(response data)，提取数据(生成item)以及生成需要进一步处理的URL的 [`Request`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/request-response.html#scrapy.http.Request) 对象。

这样我们就成功的用`scrapy`写了第一个爬虫.

启动我们创建好的爬虫:

```python
scrapy crawl qidian
```

我们能看见如下的输出:

```python
省略很多行
....
2018-07-02 19:16:06 [scrapy.core.engine] INFO: Spider opened
2018-07-02 19:16:06 [scrapy.extensions.logstats] INFO: Crawled 0 pages (at 0 pages/min), scraped 0 items (at 0 items/min)
2018-07-02 19:16:06 [scrapy.extensions.telnet] DEBUG: Telnet console listening on 127.0.0.1:6023
2018-07-02 19:16:06 [scrapy.core.engine] DEBUG: Crawled (200) <GET https://www.qidian.com/robots.txt> (referer: None)
2018-07-02 19:16:06 [scrapy.core.engine] DEBUG: Crawled (200) <GET https://www.qidian.com/> (referer: None)
['玄幻', '奇幻', '武侠', '仙侠', '都市', '现实', '军事', '历史', '游戏', '体育', '科幻', '灵异', '女生网', '二次元'] ['/xuanhuan', '/qihuan', '/wuxia', '/xianxia', '/dushi', '/xianshi', '/junshi', '/lishi', '/youxi', '/tiyu', '/kehuan', '/lingyi', '//www.qdmm.com/', '/2cy']
2018-07-02 19:16:07 [scrapy.core.scraper] ERROR: Spider must return Request, BaseItem, dict or None, got 'list' in <GET https://www.qidian.com/>
2018-07-02 19:16:07 [scrapy.core.scraper] ERROR: Spider must return Request, BaseItem, dict or None, got 'list' in <GET https://www.qidian.com/>
2018-07-02 19:16:07 [scrapy.core.engine] INFO: Closing spider (finished)
2018-07-02 19:16:07 [scrapy.statscollectors] INFO: Dumping Scrapy stats:
....
省略很多行
```

可以看到输出的log中包含定义在 `start_urls` 的初始URL，并且与spider中是一一对应的。在log中可以看到其没有指向其他页面( `(referer:None)` )。



Scrapy为Spider的 `start_urls` 属性中的每个URL创建了 [`scrapy.Request`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/request-response.html#scrapy.http.Request) 对象，并将 `parse` 方法作为回调函数(callback)赋值给了Request。

Request对象经过调度，执行生成 [`scrapy.http.Response`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/request-response.html#scrapy.http.Response) 对象并送回给spider [`parse()`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/spiders.html#scrapy.spider.Spider.parse) 方法。



##### 3. 提取Item

###### Selectors选择器简介

从网页中提取数据有很多方法。Scrapy使用了一种基于 [XPath](http://www.w3.org/TR/xpath) 和 [CSS](http://www.w3.org/TR/selectors) 表达式机制: [Scrapy Selectors](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/selectors.html#topics-selectors)。 关于selector和其他提取机制的信息请参考 [Selector文档](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/selectors.html#topics-selectors) 。

这里给出XPath表达式的例子及对应的含义:

- `/html/head/title`: 选择HTML文档中 `<head>` 标签内的 `<title>` 元素
- `/html/head/title/text()`: 选择上面提到的 `<title>` 元素的文字
- `//td`: 选择所有的 `<td>` 元素
- `//div[@class="mine"]`: 选择所有具有 `class="mine"` 属性的 `div` 元素

上边仅仅是几个简单的XPath例子，XPath实际上要比这远远强大的多。 如果您想了解的更多，我们推荐 [这篇XPath教程](http://www.w3schools.com/XPath/default.asp) 。

为了配合XPath，Scrapy除了提供了 [`Selector`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/selectors.html#scrapy.selector.Selector) 之外，还提供了方法来避免每次从response中提取数据时生成selector的麻烦。

Selector有四个基本的方法(点击相应的方法可以看到详细的API文档):

- [`xpath()`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/selectors.html#scrapy.selector.Selector.xpath): 传入xpath表达式，返回该表达式所对应的所有节点的selector list列表 。
- [`css()`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/selectors.html#scrapy.selector.Selector.css): 传入CSS表达式，返回该表达式所对应的所有节点的selector list列表.
- [`extract()`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/selectors.html#scrapy.selector.Selector.extract): 序列化该节点为unicode字符串并返回list。
- [`re()`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/selectors.html#scrapy.selector.Selector.re): 根据传入的正则表达式对数据进行提取，返回unicode字符串list列表。



##### 4 . 保存爬虫数据

最简单的方式的就使用如下方式:

```
scrapy crawl douban -o items.json
```

该命令将采用 [JSON](http://en.wikipedia.org/wiki/JSON) 格式对爬取的数据进行序列化，生成 `items.json` 文件。

在类似本篇教程里这样小规模的项目中，这种存储方式已经足够。 如果需要对爬取到的item做更多更为复杂的操作，您可以编写 [Item Pipeline](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/item-pipeline.html#topics-item-pipeline) 。 类似于我们在创建项目时对Item做的，用于您编写自己的 `tutorial/pipelines.py` 也被创建。 不过如果您仅仅想要保存item，您不需要实现任何的pipeline。

##### 2, 爬虫案例 

爬去豆瓣电影top250的电影资源.并存入到Mongodb数据库

###### 2.1建立爬虫目录

1. 添加爬取规则属性rules，这个属性是一个列表，它可以包含多个Rule,每个Rule描述了那些链接需要抓取，那些不需要。这些rule可以有callback，也可以没有。
2.  爬虫的通常需要在一个网页里面爬去其他的链接，然后一层一层往下爬，scrapy提供了LinkExtractor类用于对网页链接的提取

LinkExtractor常用的参数有：

```python
allow：提取满足正则表达式的链接
deny：排除正则表达式匹配的链接（优先级高于allow）
allow_domains：允许的域名（可以是str或list）deny_domains：排除的域名（可以是str或list）
restrict_xpaths：提取满足XPath选择条件的链接（可以是str或list）
restrict_css：提取满足css选择条件的链接（可以是str或list）
tags：提取指定标签下的链接，默认从a和area中提取（可以是str或list）
attrs：提取满足拥有属性的链接，默认为href（类型为list）
unique：链接是否去重（类型为boolean）
process_value：值处理函数（优先级大于allow）
```

代码如下:

```python
import scrapy
from scrapy.selector import Selector

from qidianspider.items import DouBanspiderItem


class DouBanSpider(scrapy.spiders.Spider):
    # 创建爬虫名称
    name = 'douban'
    search = []
    # 创建生成爬取链接
    for i in range(0, 250, 25):
        a = 'https://movie.douban.com/top250?start=%d&filter=' % i
        search.append(a)
	# 指定爬取的页面
    start_urls = set(search)

    def parse(self, response):
        res = Selector(response)
        items = DouBanspiderItem()
        # 获取电影名称
        items['name'] = res.xpath('//*[@id="content"]/div/div[1]/ol/li/div/div[2]/div[1]/a/span[1]/text()').extract()
        # 获取电影图片
        items['avator'] = res.xpath('//*[@id="content"]/div/div[1]/ol/li/div/div[1]/a/img/@src').extract()
        # 获取电影导演
        director_info = res.xpath('//*[@id="content"]/div/div[1]/ol/li/div/div[2]/div[2]/p[1]/text()[1]').extract()
        # 处理导演主演信息
        items['director'] = [info.strip().replace('\xa0', '') for info in director_info]
        # 处理电影信息
        movie_info = res.xpath('//*[@id="content"]/div/div[1]/ol/li/div/div[2]/div[2]/p[1]/text()[2]').extract()
        movie_info = [info.strip().replace('\xa0', '') for info in movie_info]
        # 处理年 国家 分类信息
        items['year'], items['country'], items['classification'] = [], [], []
        for info in movie_info:
            items['year'].append(info.split('/')[0])
            items['country'].append(info.split('/')[1])
            items['classification'].append(info.split('/')[2])
        # 评分
        items['rate'] = res.xpath('//*[@id="content"]/div/div[1]/ol/li/div/div[2]/div[2]/div/span[2]/text()').extract()
        return items

```

###### 2.2 Items

爬取的主要目标就是从非结构性的数据源提取结构性数据，例如网页。 Scrapy提供 [`Item`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/items.html#scrapy.item.Item) 类来满足这样的需求。

[`Item`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/items.html#scrapy.item.Item) 对象是种简单的容器，保存了爬取到得数据。 其提供了 [类似于词典(dictionary-like)](http://docs.python.org/library/stdtypes.html#dict) 的API以及用于声明可用字段的简单语法。

在`itmes.py`文件中声明item,Item使用简单的class定义语法以及 [`Field`](http://scrapy-chs.readthedocs.io/zh_CN/0.24/topics/items.html#scrapy.item.Field) 对象来声明。例如:

```python
import scrapy


class DouBanspiderItem(scrapy.Item):
    name = scrapy.Field()
    avator = scrapy.Field()
    director = scrapy.Field()
    year = scrapy.Field()
    country = scrapy.Field()
    classification = scrapy.Field()
    rate = scrapy.Field()

```

###### 2.3 Item Pipeline

当Item在Spider中被收集之后，它将会被传递到Item Pipeline，一些组件会按照一定的顺序执行对Item的处理。

每个item pipeline组件(有时称之为“Item Pipeline”)是实现了简单方法的Python类。他们接收到Item并通过它执行一些行为，同时也决定此Item是否继续通过pipeline，或是被丢弃而不再进行处理。

以下是item pipeline的一些典型应用：

- 清理HTML数据
- 验证爬取的数据(检查item包含某些字段)
- 查重(并丢弃)
- 将爬取结果保存到数据库中

写下面的代码前先去`setting.py`文件下写入如下配置:

```python
MONGODB_HOST = '127.0.0.1'
MONGODB_PORT = 27017
MONGODB_DB = 'douban'
MONGODB_COLLECTION = 'movie'
```

写完上面的代码后我们在写如下的代码. 这样我们可以把重要的配置都放入一个固定的位置方便我们管理.

```python
import pymongo
from scrapy.conf import settings


class DouBanspiderPipeline(object):

    def __init__(self):
        conn = pymongo.MongoClient(host=settings['MONGODB_HOST'], port=settings['MONGODB_PORT'])
        db = conn[settings['MONGODB_DB']]
        self.collection = db[settings['MONGODB_COLLECTION']]

    def process_item(self, item, spider):
        for i in range(len(item['name'])):
            data = {}
            data['name'] = item['name'][i]
            data['avator'] = item['avator'][i]
            data['director'] = item['director'][i]
            data['year'] = item['year'][i]
            data['country'] = item['country'][i]
            data['classification'] = item['classification'][i]
            data['rate'] = item['rate'][i]
            # print(data)
            self.collection.insert(data)
        return item
```

写完这些后我们的代码就告一段落了.接下来我们需要检查我们的mongodb数据库中是否有我们要存的数据库和`collection`.

###### 2.4 检查数据库

在我们本地的终端中输入`mongo`

```python
lizhonglindeMacBook-Pro:~ lizhonglin$ mongo
MongoDB shell version v3.6.5
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.6.5
Server has startup warnings: 
2018-07-01T09:41:06.676+0800 I CONTROL  [initandlisten] 
2018-07-01T09:41:06.676+0800 I CONTROL  [initandlisten] ** WARNING: Access control is not enabled for the database.
2018-07-01T09:41:06.676+0800 I CONTROL  [initandlisten] **          Read and write access to data and configuration is unrestricted.
2018-07-01T09:41:06.676+0800 I CONTROL  [initandlisten] 
> 
```

然后在输入

```
show dbs
```

就能看见目前我们的数据库

```python
show dbs
admin     0.000GB
config    0.000GB
local     0.000GB
```

没有我们就用我们的创建数据库的命令进行创建参考这篇文章:[<<MongoDB数据的创建和用法>>](https://leezhonglin.github.io/2018/06/30/mongodb%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4/#more)

这些工作都做完了.就来到我们的最后一步.启动我们的爬虫进行爬取.

```
scrapy crawl douban
```

最后完成的效果图:

![huj](/Users/lizhonglin/Desktop/shuju.png)

至此250条数据就完美搞定.
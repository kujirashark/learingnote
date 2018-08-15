#### Spider学习笔记

##### 前言:

​	网络爬虫（Web Spider。又被称为网页蜘蛛。网络机器人，又称为网页追逐者），是一种依照一定的规则，自己主动的抓取万维网信息的程序或者脚本。另外一些不常使用的名字还有蚂蚁，自己主动索引。模拟程序或者蠕虫。假设把互联网比喻成一个蜘蛛网，那么Spider就是在网上爬来爬去的蜘蛛。

​	网络蜘蛛是通过网页的链接地址来寻找网页的。从站点某一个页面（一般是首页）開始，读取网页的内容。找到在网页中的其他链接地址。然后通过这些链接地址寻找下一个网页。这样一直循环下去，直到把这个站点全部的网页都抓取完为止。假设把整个互联网当成一个站点。那么网络蜘蛛就能够用这个原理把互联网上全部的网页都抓取下来。这样看来，网络爬虫就是一个爬行程序，一个抓取网页的程序。

**简单地说，网络爬虫的基本任务就是抓取网页内容。**



##### 1. 数据分析和采集

本爬虫教程中使用的python版本统一为python3.X的版本

###### 1.1 数据分析

爬取网页信息可以使用很多的技术：

1. 获取网页信息：urllib、urllib3、requests

   ```
    requests为第三方的库，需要安装才能使用

    pip install requests
   ```

2. 解析网页信息：beautifulsoup4(bs4)、re、xpath、lxml

   ```
    bs4为第三方的库，需要安装才能使用

    pip install beautifulsoup4

    使用的时候 from bs4 import BeautifulSoup 这样导入
   ```

Python 标准库中自带了 xml 模块，但是性能不够好，而且缺乏一些人性化的 API，相比之下，第三方库 lxml 是用 Cython 实现的，而且增加了很多实用的功能。

```
安装lxml，在新版本中无法使用from lxml import etree
 
 pip install lxml 并不推荐这样去安装lxml

 推荐安装的方法：访问网站(https://www.lfd.uci.edu/~gohlke/pythonlibs/#lxml)下载lxml的安装whl文件，然后进行安装。
```

```
pip install lxml-4.2.1-cp36-cp36m-win_amd64.whl
```

1. 动态数据解析

   通用：selenium(自动化测试框架)

###### 1.2 数据采集

1. 存储：mysql、redis、mongodb、sqlalchemy

2. 序列化：json

3. 调度器：进程、线程、协程

   ​

##### 2. 请求头分析

```
# 浏览器告诉服务器可以接收的文本类型, */*表示任何类型都可以接收
Accept: text/html, */*;q=0.8

# 浏览器告诉服务器，数据可以压缩，页面可以解压数据然后进行渲染。做爬虫的时候，最好不要写该参数
Accept-Encoding: gzip, deflate 

# 语言类型
Accept-Language: zh-CN,zh;q=0.9 

Cache-Control: max-age=0

# 保持连接
Connection: keep-alive 

# 会话 
Cookie: Hm_lvt_3bfcc098e0da26d58c321ba579b04b2f=1527581188,1528137133

# 域名
Host: www.cdtopspeed.com 

Upgrade-Insecure-Requests: 1

# 用户代理, 使得服务器能够识别请求是通过浏览器请求过来的，其中包含浏览器的名称/版本等信息
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
```

其中在爬虫中最重要的就是User-Agent：在下面urllib的使用中就会详细的解释User-Agent的使用

##### 3.urllib库的使用

`urllib`是Python自带的标准库，无需安装，直接可以用。

提供了如下功能：

- 网页请求   
- 响应获取
- 代理和cookie设置
- 异常处理
- URL解析

> 爬虫所需要的功能，基本上在`urllib`中都能找到，学习这个标准库，可以更加深入的理解后面更加便利的`requests`库。

###### 3.1 发起请求

模拟浏览器发起一个 HTTP 请求，我们需要用到 urllib.request 模块。urllib.request 的作用不仅仅是发起请求， 还能获取请求返回结果。发起请求，单靠 `urlopen()` 方法就可以叱咤风云。我们先看下 urlopen() 的 API

```python
urllib.request.urlopen(url, data=None, [timeout, ]*, cafile=None, capath=None, cadefault=False, context=None)
```

> 1. 第一个参数String 类型的地址
> 2. `data`是bytes类型的的内容,可以通过bytes()函数转化字节流,它也是可选参数.使用data参数.请求方式变成以POST方式提交表单.使用标准格式是`application/x-www-form-urlencoded`
> 3. `timeout` 参数是用于设置请求超时时间,单位是秒.
> 4. `cafile`和`capath`代表CA证书和CA证书的路径.如果使用HTTPS则需要用到.
> 5. `context`参数是`ssl.SSLContext`类型,用来指定SSL设置
> 6. `cadefault`参数已经被弃用.
> 7. 该方法也可以单独传入`urllib.request.Resquest`对象
> 8. 该函数返回结果是一个`http.client.HTTPResponse`对象

###### 3.2 简单抓取网页

我们去获取百度首页的源代码

```python
import urllib.request

url = "http://www.baidu.com"
response = urllib.request.urlopen(url)
html = response.read()         # 获取到页面的源代码
print(html.decode('utf-8'))    # 转化为 utf-8 编码

```

###### 3.2 设置请求超时

有些请求可能因为网络原因无法得到响应。因此，我们可以手动设置超时时间。当请求超时，我们可以采取进一步措施，例如选择直接丢弃该请求或者再请求一次。

```python
import urllib.request

url = "http://www.baidu.com"
response = urllib.request.urlopen(url, timeout=1)
print(response.read().decode('utf-8'))
```

###### 3.3 ssl认证 

什么是 SSL 证书？

SSL 证书就是遵守 SSL 安全套接层协议的服务器数字证书。

而 SSL 安全协议最初是由美国网景 Netscape Communication 公司设计开发的，全称为：安全套接层协议 (Secure Sockets Layer) ， 它指定了在应用程序协议 ( 如 HTTP 、 Telnet 、 FTP) 和 TCP/IP 之间提供数据安全性分层的机制，它是在传输通信协议 (TCP/IP) 上实现的一种安全协议，采用公开密钥技术，它为 TCP/IP 连接提供数据加密、服务器认证、消息完整性以及可选的客户机认证。由于此协议很好地解决了互联网明文传输的不安全问题，很快得到了业界的支持，并已经成为国际标准。

SSL 证书由浏览器中“受信任的根证书颁发机构”在验证服务器身份后颁发，具有网站身份验证和加密传输双重功能。

如果能使用 https:// 来访问某个网站，就表示此网站是部署了SSL证书。一般来讲，如果此网站部署了SSL证书，则在需要加密的页面会自动从 http:// 变为 https:// ，如果没有变，你认为此页面应该加密，您也可以尝试直接手动在浏览器地址栏的http后面加上一个英文字母“ s ”后回车，如果能正常访问并出现安全锁，则表明此网站实际上是部署了SSL证书，只是此页面没有做 https:// 链接；如果不能访问，则表明此网站没有部署 SSL证书。

有些时候我们在请求的时候回出现如下这样的错误信息.

```
urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:833)>
```

如果不忽略ssl的安全认证的话，网页的源码会提示ssl认证问题，需要提供ssl认证。我们在做爬虫的时候，自动设置忽略掉ssl认证即可。 如下案例.在京东首页搜索某个商品能出现多少结果.

```python
import re
import urllib.request

# 使用urllib进行中文的编码和解码
from urllib import parse

import ssl


def main(url):
    # 请求头
    header = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'
    }
    # 设置忽略ssl认证
    context = ssl._create_unverified_context()
    # 发起请求
    req = urllib.request.Request(url, headers=header)
    # 得到响应数据
    res = urllib.request.urlopen(req, context=context)
	# 使用正则匹配需要的数据
    conent_re = re.findall('page_count:"(\d+)"', res.read().decode('utf-8'))
    
    print('共有' + conent_re[0] + '页数据')


if __name__ == "__main__":
    
    msg = input('请输入搜索信息:')
    
    # 使用urllib进行中文的编码和解码
    search = parse.urlencode({'keyword': msg})
    
    url = 'https://search.jd.com/Search?%s' % search
    main(url)
```

##### 4. 使用urllib进行中文的编码和解码

```
from urllib import parse

# 编码
enstr = parse.urlencode({'kd': '忠林'})
# 打印的结果为 kd=%E5%BF%A0%E6%9E%97
print(enstr)

# 解码
destr = parse.unquote(enstr)
# 解码的结果为 kd=忠林
print(destr)
```

案例1,爬取格言网中的`100句关于梦想的名言警句`

```python
import re
import urllib.request
import ssl


def get_motto():
    header = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'
    }
    # 请求的url
    url = 'https://www.geyanw.com/mingyanjingju/1857.html'
    
    context = ssl._create_unverified_context()
    
    req = urllib.request.Request(url, headers=header)
    
    res = urllib.request.urlopen(req, context=context)
    
    # 正则匹配
    pattern = re.compile('<p>(.*?)</p>')

    content_result = re.findall(pattern, res.read().decode('gbk'))
	
    # 写入文件中去
    with open('12.txt', 'w+', encoding='utf-8') as f:
        for i in content_result:
            if i != '&nbsp;':
                f.writelines(i + '\n')
        # 关闭文件对象       
        f.close()


if __name__ == "__main__":
    get_motto()
```



##### 5. 数据采集

数据采集，针对网页获取源码，按照一定的正则匹配，或者xpath的规则去匹配出我们需要的结果，进行分类筛选入库等操作。在本章中会讲到requests，beautifulsoup等工具去爬取网页，获取相关需要的信息。

###### 5.1 BeautifSoup库的使用

Beautiful Soup 是一个可以从HTML或XML文件中提取数据的Python库.它能够通过你喜欢的转换器实现惯用的文档导航,查找,修改文档的方式.Beautiful Soup会帮你节省数小时甚至数天的工作时间.-----引入[官网地址](https://www.crummy.com/software/BeautifulSoup/bs4/doc/index.zh.html)的一句话

Beautiful Soup 4 通过PyPi发布,所以如果你无法使用系统包管理安装,那么也可以通过 easy_install 或 pip 来安装.包的名字是 beautifulsoup4 ,这个包兼容Python2和Python3.

```python
pip install beautifulsoup4
```

###### 5.2 解析语法、find、find_all  

```python
 find_all( name , attrs , recursive , text , **kwargs )
```

find_all() 方法搜索当前tag的所有tag子节点,并判断是否符合过滤器的条件

```
1. 查询所有a标签的内容

	soup.find_all('a')

2. 查询所有a标签下class样式为bb的内容

	soup.find_all('a', 'bb')

3. 查询所有id样式为cc的内容

	soup.find_all(id='cc')
```

案例: 爬去知乎发现里面的问答

```python
import requests
from bs4 import BeautifulSoup
import pymysql


def get_mysql(sql, params_list):
    # 建立连接
    conn = pymysql.connect(port=3306, host='localhost', password='123456', 
                           charset='utf8', user='root',database='spider')
    # 创建游标对象
    cursor = conn.cursor()
    # 添加数据
    cursor.executemany(sql, params_list)
    # 提交
    conn.commit()
    # 关闭游标连接
    conn.close()


def start_crawl(url):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'
    }
    res = requests.get(url, headers=headers)
    
    soup = BeautifulSoup(res.text, 'lxml')
    # 筛选类为question_link 的a标签
    a_links = soup.find_all('a', 'question_link')

    result_list = []

    for link in a_links:
        # 获取问题的连接
        answer_link = 'https://www.zhihu.com' + link.get('href')
        # 获取问题的标题
        title = link.get_text().replace('\n', '')
        # 追加结果到列表
        result_list.append([title, answer_link])
    # 创建sql语句
    sql = 'insert into result_news values (%s, %s)'
    # 写入数据库
    get_mysql(sql, result_list)


if __name__ == '__main__':
    url = 'https://www.zhihu.com/explore'
    start_crawl(url)

```

##### 6. requests库的使用

[中文官网地址](http://docs.python-requests.org/zh_CN/latest/user/quickstart.html)

###### 6.1安装

```python
pip install requests
```

###### 6.2 发送请求，GET、POST、PUT、PATCH、DELETE

使用 Requests 发送网络请求非常简单。

一开始要导入 Requests 模块：

```python
import requests
```

然后，尝试获取某个网页。本例子中，我们来获取 Github 的公共时间线：

```python
r = requests.get('https://api.github.com/events')
```

现在，我们有一个名为 r 的 Response 对象。我们可以从这个对象中获取所有我们想要的信息。

Requests 简便的 API 意味着所有 HTTP 请求类型都是显而易见的。例如，你可以这样发送一个 HTTP POST 请求：

```python
r = requests.post('http://httpbin.org/post', data = {'key':'value'})
```

漂亮，对吧？那么其他 HTTP 请求类型：PUT，DELETE，HEAD 以及 OPTIONS 又是如何的呢？都是一样的简单：

```python
r = requests.put('http://httpbin.org/put', data = {'key':'value'})

r = requests.delete('http://httpbin.org/delete')

r = requests.head('http://httpbin.org/get')

r = requests.options('http://httpbin.org/get')
```

都很不错吧，但这也仅是 Requests 的冰山一角呢。

###### 6.3 传递 URL 参数

你也许经常想为 URL 的查询字符串(query string)传递某种数据。如果你是手工构建 URL，那么数据会以键/值对的形式置于 URL 中，跟在一个问号的后面。例如， httpbin.org/get?key=val。

Requests 允许你使用 params 关键字参数，以一个字符串字典来提供这些参数。

举例来说，如果你想传递 key1=value1 和 key2=value2 到 httpbin.org/get ，那么你可以使用如下代码：

```python
payload = {'key1': 'value1', 'key2': 'value2'}

r = requests.get("http://httpbin.org/get", params=payload)
```

通过打印输出该 URL，你能看到 URL 已被正确编码：

```python
print(r.url)

http://httpbin.org/get?key2=value2&key1=value1
```

注意字典里值为 None 的键都不会被添加到 URL 的查询字符串里。

你还可以将一个列表作为值传入：

```python
payload = {'key1': 'value1', 'key2': ['value2', 'value3']}

r = requests.get('http://httpbin.org/get', params=payload)

print(r.url)

http://httpbin.org/get?key1=value1&key2=value2&key2=value3
```

###### 6.4 响应内容

我们能读取服务器响应的内容。再次以 GitHub 时间线为例：

```python
import requests
r = requests.get('https://api.github.com/events')
r.text

u'[{"repository":{"open_issues":0,"url":"https://github.com/...
```

Requests 会自动解码来自服务器的内容。大多数 unicode 字符集都能被无缝地解码。

请求发出后，Requests 会基于 HTTP 头部对响应的编码作出有根据的推测。当你访问 r.text 之时，Requests 会使用其推测的文本编码。你可以找出 Requests 使用了什么编码，并且能够使用 r.encoding 属性来改变它：

```python
r.encoding
'utf-8'

r.encoding = 'ISO-8859-1'
```

如果你改变了编码，每当你访问 r.text ，Request 都将会使用 r.encoding 的新值。你可能希望在使用特殊逻辑计算出文本的编码的情况下来修改编码。比如 HTTP 和 XML 自身可以指定编码。这样的话，你应该使用 r.content 来找到编码，然后设置 r.encoding 为相应的编码。这样就能使用正确的编码解析 r.text 了。

在你需要的情况下，Requests 也可以使用定制的编码。如果你创建了自己的编码，并使用 codecs 模块进行注册，你就可以轻松地使用这个解码器名称作为 r.encoding 的值， 然后由 Requests 来为你处理编码。

###### 6.5二进制响应内容

你也能以字节的方式访问请求响应体，对于非文本请求：

```python
r.content

b'[{"repository":{"open_issues":0,"url":"https://github.com/...
```

Requests 会自动为你解码 gzip 和 deflate 传输编码的响应数据。

例如，以请求返回的二进制数据创建一张图片，你可以使用如下代码：

```python
from PIL import Image
from io import BytesIO

i = Image.open(BytesIO(r.content))
```

###### 6.6 JSON 响应内容

Requests 中也有一个内置的 JSON 解码器，助你处理 JSON 数据：

```python
import requests

r = requests.get('https://api.github.com/events')
r.json()
[{u'repository': {u'open_issues': 0, u'url': 'https://github.com/...
```

如果 JSON 解码失败， r.json() 就会抛出一个异常。例如，响应内容是 401 (Unauthorized)，尝试访问 r.json() 将会抛出 ValueError: No JSON object could be decoded 异常。

需要注意的是，成功调用 r.json() 并**不**意味着响应的成功。有的服务器会在失败的响应中包含一个 JSON 对象（比如 HTTP 500 的错误细节）。这种 JSON 会被解码返回。要检查请求是否成功，请使用 r.raise_for_status() 或者检查 r.status_code 是否和你的期望相同。

###### 6.7 原始响应内容

在罕见的情况下，你可能想获取来自服务器的原始套接字响应，那么你可以访问 r.raw。 如果你确实想这么干，那请你确保在初始请求中设置了 stream=True。具体你可以这么做：

```python
r = requests.get('https://api.github.com/events', stream=True)
r.raw
<requests.packages.urllib3.response.HTTPResponse object at 0x101194810>
r.raw.read(10)
'\x1f\x8b\x08\x00\x00\x00\x00\x00\x00\x03'
```

但一般情况下，你应该以下面的模式将文本流保存到文件：

```python
with open(filename, 'wb') as fd:
    for chunk in r.iter_content(chunk_size):
        fd.write(chunk)
```

使用 Response.iter_content 将会处理大量你直接使用 Response.raw 不得不处理的。 当流下载时，上面是优先推荐的获取内容方式。 Note that chunk_size can be freely adjusted to a number that may better fit your use cases.

###### 6.8 定制请求头

如果你想为请求添加 HTTP 头部，只要简单地传递一个 dict 给 headers 参数就可以了。

例如，在前一个示例中我们没有指定 content-type:

```python
url = 'https://api.github.com/some/endpoint'
headers = {'user-agent': 'my-app/0.0.1'}

r = requests.get(url, headers=headers)
```

注意: 定制 header 的优先级低于某些特定的信息源，例如：

如果在 .netrc 中设置了用户认证信息，使用 headers= 设置的授权就不会生效。而如果设置了 auth= 参数，`.netrc` 的设置就无效了。

如果被重定向到别的主机，授权 header 就会被删除。

代理授权 header 会被 URL 中提供的代理身份覆盖掉。

在我们能判断内容长度的情况下，header 的 Content-Length 会被改写。

更进一步讲，Requests 不会基于定制 header 的具体情况改变自己的行为。只不过在最后的请求中，所有的 header 信息都会被传递进去。

注意: 所有的 header 值必须是 string、bytestring 或者 unicode。尽管传递 unicode header 也是允许的，但不建议这样做。

更加复杂的 POST 请求

通常，你想要发送一些编码为表单形式的数据——非常像一个 HTML 表单。要实现这个，只需简单地传递一个字典给 data 参数。你的数据字典在发出请求时会自动编码为表单形式：

```python
payload = {'key1': 'value1', 'key2': 'value2'}

r = requests.post("http://httpbin.org/post", data=payload)

print(r.text)

{
  ...
  "form": {
    "key2": "value2",
    "key1": "value1"
  },
  ...
}
```

你还可以为 data 参数传入一个元组列表。在表单中多个元素使用同一 key 的时候，这种方式尤其有效：

```python
payload = (('key1', 'value1'), ('key1', 'value2'))
r = requests.post('http://httpbin.org/post', data=payload)
print(r.text)

{
  ...
  "form": {
    "key1": [
      "value1",
      "value2"
    ]
  },
  ...
}
```

很多时候你想要发送的数据并非编码为表单形式的。如果你传递一个 string 而不是一个 dict，那么数据会被直接发布出去。

例如，Github API v3 接受编码为 JSON 的 POST/PATCH 数据：

```python
import json

url = 'https://api.github.com/some/endpoint'
payload = {'some': 'data'}

r = requests.post(url, data=json.dumps(payload))
```

此处除了可以自行对 dict 进行编码，你还可以使用 json 参数直接传递，然后它就会被自动编码。这是 2.4.2 版的新加功能：

```python
url = 'https://api.github.com/some/endpoint'
payload = {'some': 'data'}

r = requests.post(url, json=payload)
```

POST一个多部分编码(Multipart-Encoded)的文件

Requests 使得上传多部分编码文件变得很简单：

```python
url = 'http://httpbin.org/post'
files = {'file': open('report.xls', 'rb')}

r = requests.post(url, files=files)
r.text

{
  ...
  "files": {
    "file": "<censored...binary...data>"
  },
  ...
}
```

你可以显式地设置文件名，文件类型和请求头：

```python
url = 'http://httpbin.org/post'
files = {'file': ('report.xls', open('report.xls', 'rb'), 'application/vnd.ms-excel', {'Expires': '0'})}

r = requests.post(url, files=files)
r.text
{
  ...
  "files": {
    "file": "<censored...binary...data>"
  },
  ...
}
```

如果你想，你也可以发送作为文件来接收的字符串：

```python
url = 'http://httpbin.org/post'
files = {'file': ('report.csv', 'some,data,to,send\nanother,row,to,send\n')}

r = requests.post(url, files=files)
r.text
{
  ...
  "files": {
    "file": "some,data,to,send\\nanother,row,to,send\\n"
  },
  ...
}
```

如果你发送一个非常大的文件作为 multipart/form-data 请求，你可能希望将请求做成数据流。默认下 requests 不支持, 但有个第三方包 requests-toolbelt 是支持的。你可以阅读 toolbelt 文档 来了解使用方法。

###### 

> **警告:**
>
> 我们强烈建议你用二进制模式(binary mode)打开文件。这是因为 Requests 可能会试图为你提供 Content-Length header，在它这样做的时候，这个值会被设为文件的字节数（bytes）。如果用文本模式(text mode)打开文件，就可能会发生错误。

###### 6.9 响应状态码

我们可以检测响应状态码：

```python
r = requests.get('http://httpbin.org/get')
r.status_code
200
```

为方便引用，Requests还附带了一个内置的状态码查询对象：

```python
r.status_code == requests.codes.ok

True
```

如果发送了一个错误请求(一个 4XX 客户端错误，或者 5XX 服务器错误响应)，我们可以通过 Response.raise_for_status() 来抛出异常：

```python
bad_r = requests.get('http://httpbin.org/status/404')
bad_r.status_code
404

bad_r.raise_for_status()
Traceback (most recent call last):
	File "requests/models.py", line 832, in raise_for_status
    		raise http_error
```

requests.exceptions.HTTPError: 404 Client Error 但是，由于我们的例子中 r 的 status_code 是 200 ，当我们调用 raise_for_status() 时，得到的是：

```python
r.raise_for_status()
None
```

一切都挺和谐哈。

###### 6.10 响应头

我们可以查看以一个 Python 字典形式展示的服务器响应头：

```python
r.headers

{
    'content-encoding': 'gzip',
    'transfer-encoding': 'chunked',
    'connection': 'close',
    'server': 'nginx/1.0.4',
    'x-runtime': '148ms',
    'etag': '"e1ca502697e5c9317743dc078f67693f"',
    'content-type': 'application/json'
}
```

但是这个字典比较特殊：它是仅为 HTTP 头部而生的。根据 RFC 2616， **HTTP 头部是大小写不敏感的。**

因此，我们可以使用任意大写形式来访问这些响应头字段：

```python
r.headers['Content-Type']
'application/json'

r.headers.get('content-type')
'application/json'
```

它还有一个特殊点，那就是服务器可以多次接受同一 header，每次都使用不同的值。但 Requests 会将它们合并，这样它们就可以用一个映射来表示出来，参见 RFC 7230:

A recipient MAY combine multiple header fields with the same field name into one "field-name: field-value" pair, without changing the semantics of the message, by appending each subsequent field value to the combined field value in order, separated by a comma.

接收者可以合并多个相同名称的 header 栏位，把它们合为一个 "field-name: field-value" 配对，将每个后续的栏位值依次追加到合并的栏位值中，用逗号隔开即可，这样做不会改变信息的语义。

###### 6.11 Cookie

如果某个响应中包含一些 cookie，你可以快速访问它们：

```python
url = 'http://example.com/some/cookie/setting/url'
r = requests.get(url)

r.cookies['example_cookie_name']
'example_cookie_value'
```

要想发送你的cookies到服务器，可以使用 cookies 参数：

```python
url = 'http://httpbin.org/cookies'
cookies = dict(cookies_are='working')

r = requests.get(url, cookies=cookies)
r.text
'{"cookies": {"cookies_are": "working"}}'
```

Cookie 的返回对象为 RequestsCookieJar，它的行为和字典类似，但接口更为完整，适合跨域名跨路径使用。你还可以把 Cookie Jar 传到 Requests 中：

```python
jar = requests.cookies.RequestsCookieJar()
jar.set('tasty_cookie', 'yum', domain='httpbin.org', path='/cookies')
jar.set('gross_cookie', 'blech', domain='httpbin.org', path='/elsewhere')
url = 'http://httpbin.org/cookies'
r = requests.get(url, cookies=jar)
r.text
'{"cookies": {"tasty_cookie": "yum"}}'
```

###### 6.12 重定向与请求历史

默认情况下，除了 HEAD, Requests 会自动处理所有重定向。

可以使用响应对象的 history 方法来追踪重定向。

Response.history 是一个 Response 对象的列表，为了完成请求而创建了这些对象。这个对象列表按照从最老到最近的请求进行排序。

例如，Github 将所有的 HTTP 请求重定向到 HTTPS：

```python
r = requests.get('http://github.com')

r.url
'https://github.com/'

r.status_code
200

r.history
[<Response [301]>]
```

如果你使用的是GET、OPTIONS、POST、PUT、PATCH 或者 DELETE，那么你可以通过 allow_redirects 参数禁用重定向处理：

```python
r = requests.get('http://github.com', allow_redirects=False)
r.status_code
301
r.history
[]
```

如果你使用了 HEAD，你也可以启用重定向：

```python
r = requests.head('http://github.com', allow_redirects=True)
r.url
'https://github.com/'
r.history
[<Response [301]>]
```

###### 6.13 超时

你可以告诉 requests 在经过以 timeout 参数设定的秒数时间之后停止等待响应。基本上所有的生产代码都应该使用这一参数。如果不使用，你的程序可能会永远失去响应：

```python
requests.get('http://github.com', timeout=0.001)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
requests.exceptions.Timeout: HTTPConnectionPool(host='github.com', port=80): Request timed out. (timeout=0.001)
```

> **注意:**
>
> timeout 仅对连接过程有效，与响应体的下载无关。 timeout 并不是整个下载响应的时间限制，而是如果服务器在 timeout 秒内没有应答，将会引发一个异常（更精确地说，是在 timeout 秒内没有从基础套接字上接收到任何字节的数据时）If no timeout is specified explicitly, requests do not time out.

###### 错误与异常

遇到网络问题（如：DNS 查询失败、拒绝连接等）时，Requests 会抛出一个 ConnectionError 异常。

如果 HTTP 请求返回了不成功的状态码， Response.raise_for_status() 会抛出一个 HTTPError 异常。

若请求超时，则抛出一个 Timeout 异常。

若请求超过了设定的最大重定向次数，则会抛出一个 TooManyRedirects 异常。

所有Requests显式抛出的异常都继承自 requests.exceptions.RequestException 。

**案例1:爬取豆瓣电影的电影名、评分等信息**

```python
import urllib.request
from urllib import parse
import json

"""
获取豆瓣电影中的电影资源
豆瓣电影url地址：https://movie.douban.com/explore#!type=movie&tag=%E7%83%AD%E9%97%A8&sort=recommend&page_limit=20&page_start=0
分析：
    1. 该页面中的的电影资源信息都是通过ajax异步加载进行刷新出来的
    2. 在F12下的network中过滤XHR(XMLHTTPRESPONSE)请求，可以查看到真正的异步的请求地址如下
        https://movie.douban.com/j/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&sort=recommend&page_limit=20&page_start=20
    3. 正在的请求地址中，type为类型，tag为标签（热门、经典、最新、爱情、科幻等等），sort为排序，page_limit为每一个的条数，page_start为开始的条数下标
    4. 获取tag类型的url地址为： https://movie.douban.com/j/search_tags?type=movie&source=
"""


def urllib_open(url):
    """
    公共的处理代码
    """
    header = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'
    }
    req = urllib.request.Request(url=url, headers=header)
    res = urllib.request.urlopen(req)

    return res.read().decode('utf-8')


def get_movie_tag(url):
    """
    获取电影的分类tag
    """
    tag_res = urllib_open(url)
    # 返回的tag_res的结果为'{"tags":["热门","最新","经典","可播放","豆瓣高分","冷门佳片","华语","欧美","韩国","日本","动作","喜剧","爱情","科幻","悬疑","恐怖","成长"]}'
    # 其结果为一个字符串类型的数据，需要将之转化为字典类型的
    result = json.loads(tag_res)
    content = result['tags']
    return content


def get_movies(tag_url, movies_url):
    tag_content = get_movie_tag(tag_url)
    # 循环tag的内容，拼接出指定tag的电影内容
    # movies_url中指定电影类型的参数是tag=热门或者最新等等，所以需要进行tag的内容的编码
    tag_list = []
    print(tag_content)
    for tag in tag_content:
        data = {'tag': tag}
        search_tag = parse.urlencode(data)
        tag_list.append(search_tag)

    for search_tag in tag_list:
        seatch_url = movies_url
        seatch_url = seatch_url % (search_tag)
        movies_res = urllib_open(seatch_url)
        res = json.loads(movies_res)
        result = res['subjects']
        for res in result:
            print('标题:%s，评分：%s' % (res['title'], res['rate']))

if __name__ == '__main__':
    tag_url = 'https://movie.douban.com/j/search_tags?type=movie&source='
    movies_url = 'https://movie.douban.com/j/search_subjects?type=movie&%s&sort=recommend&page_limit=20&page_start=0'
    get_movies(tag_url, movies_url)
```

**案例2:爬取图片** 

```python
import requests
import os
from bs4 import BeautifulSoup


def start_spider_image(url):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'
    }
    req = requests.get(url, headers=headers)
    soup = BeautifulSoup(req.text, 'lxml')
    imgs = soup.find_all('img', 'photo-item__img')
    img_link_list = []
    for img in imgs:
        img_link = img.get('data-big-src')
        img_link_list.append(img_link)

    # 文件保存的路径
    path = '/Users/lizhonglin/Desktop/Code/spider00/day02/image'

    # 获取文件名
    for i in img_link_list:
        # 获取保存文件的文件名
        filename = i.split('?')[0].split('/')[-1]
        # 文件写入操作
        with open(filename, 'wb') as f:
            # 切换到image目录
            os.chdir(path)
            # 写入图片数据
            f.write(requests.get(i).content)
            f.close()


if __name__ == '__main__':
    image = input('请输入搜索关键词英文:')
    # 请求url
    url = 'https://www.pexels.com/search/' + image + '/'
    start_spider_image(url)
```



​	**在使用爬虫之前，我们需要了解到很多的概念知识，包括同步、异步概念， 阻塞、非阻塞概念，并发、并行概念，多线程、多进程概念，线程锁概念，协程概念等等**



##### 7 . 同步异步

1. ###### 同步

   - 不同程序单元为了完成某个任务，在执行过程中需靠某种通信方式以**协调一致**，称这些程序单元是同步执行的。
   - 例如购物系统中更新商品库存，需要用“行锁”作为通信信号，让不同的更新请求强制排队顺序执行，那更新库存的操作是同步的。
   - 简言之，**同步意味着有序**。

2. ###### 异步

   - 为完成某个任务，不同程序单元之间**过程中无需通信协调**，也能完成任务的方式。
   - 不相关的程序单元之间可以是异步的。
   - 例如，爬虫下载网页。调度程序调用下载程序后，即可调度其他任务，而无需与该下载任务保持通信以协调行为。不同网页的下载、保存等操作都是无关的，也无需相互通知协调。这些异步操作的完成时刻并不确定。
   - 简言之，**异步意味着无序**。

   上文提到的“通信方式”通常是指异步和并发编程提供的同步原语，如信号量、锁、同步队列等等。我们需知道，虽然这些通信方式是为了让多个程序在一定条件下同步执行，但正因为是异步的存在，才需要这些通信方式。如果所有程序都是按序执行，其本身就是同步的，又何需这些同步信号呢？

   ​

##### 8. 阻塞非阻塞

1. 阻塞

   - 程序未得到所需计算资源时被挂起的状态。
   - **程序在等待某个操作完成期间，自身无法继续干别的事情，则称该程序在该操作上是阻塞的。**
   - 常见的阻塞形式有：网络I/O阻塞、磁盘I/O阻塞、用户输入阻塞等。

   阻塞是无处不在的，包括CPU切换上下文时，所有的进程都无法真正干事情，它们也会被阻塞。（如果是多核CPU则正在执行上下文切换操作的核不可被利用。）

   ​

2. 非阻塞

   - **程序在等待某操作过程中，自身不被阻塞，可以继续运行干别的事情，则称该程序在该操作上是非阻塞的。**
   - 非阻塞并**不是**在任何程序级别、任何情况下都可以存在的。
   - 仅当程序封装的级别可以囊括独立的子程序单元时，它才可能存在非阻塞状态。

   非阻塞的存在是因为阻塞存在，正因为某个操作阻塞导致的耗时与效率低下，我们才要把它变成非阻塞的。

   ​

##### 9. 同步和阻塞的区别

同步是一个过程，阻塞是线程的一个状态。

当多个线程操作同一公共变量的时候可能会出现竞争的情况，这时候需要使用同步来防止多个线程同时占用资源的情况，让一个线程在运行状态中，另外的线程处于就绪状态，当前一个线程处于暂停状态的时候，后面的处于就绪状态的线程，获取到资源以后，获取到时间片以后就会处于运行状态了。所以阻塞是线程的一个状态而已



##### 10. 并发 并行

1. 并发

   - 并发描述的是程序的组织结构。指程序要被设计成多个可独立执行的子任务。
   - **以利用有限的计算机资源使多个任务可以被实时或近实时执行为目的。**

2. 并行

   - 并行描述的是程序的执行状态。指多个任务同时被执行。
   - **以利用富余计算资源（多核CPU）加速完成多个任务为目的。**

   并发提供了一种程序组织结构方式，让问题的解决方案可以并行执行，但并行执行不是必须的。

   ​

> 总结:
>
> - **并行**是为了利用多核加速多任务完成的进度
> - **并发**是为了让独立的子任务都有机会被尽快执行，但不一定能加速整体进度
> - **非阻塞**是为了提高程序整体执行效率
> - **异步**是高效地组织非阻塞任务的方式
>
> 要支持并发，必须拆分为多任务，不同任务相对而言才有阻塞/非阻塞、同步/异步。所以，并发、异步、非阻塞三个词总是如影随形。

上面有这样的案例我们可以改造一下案例一,爬取豆瓣电影的名称和评分[使用多线程来实现]

```python
import time
import threading
import requests
from urllib import parse


def get_tags(url):
    """
    获取电影分类
    :param url:
    :return: 电影分类信息
    """
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'
    }

    req = requests.get(url, headers=headers)
    return req.json()


def get_movie(url):
    """
    获取电影信息
    :param url:
    :return:
    """
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'
    }
    req = requests.get(url, headers=headers)
    result = req.json()
    for i in result['subjects']:
        title = i['title']
        rate = i['rate']
        #  这步可以在优化一下 存储到数据库而不使用print.
        print('名称:%s ,评分:%s' % (title, rate))


class GetMovie(threading.Thread):
    """定义多线程类"""

    def __init__(self):
        super(GetMovie, self).__init__()
        # 设置线程锁
        self.movie_lock = threading.Lock()

    def update_movie_lock(self):
        # 判断是否被锁住
        if self.movie_lock.acquire():
            # 如果被锁住就弹出一个连接,如果所有结果都被弹出了 就返回空
            link = movie_url_list.pop() if movie_url_list else ''
            # 释放线程锁
            self.movie_lock.release()
            return link

    def run(self):
        # 获取url的地址
        link = self.update_movie_lock()
        # 判断是否有url
        if link:
            # 获取资源
            get_movie(link)


if __name__ == '__main__':
    # 分类的url
    url = 'https://movie.douban.com/j/search_tags?type=movie&source='
    # 电影信息的url
    movie_url = 'https://movie.douban.com/j/search_subjects?type=movie&%s&sort=recommend&page_limit=20&page_start=0'
    # 分类的所有信息
    tags_list = get_tags(url)
    # 定义全局变量
    global movie_url_list
    # 定义所有的电影资源的url空列表
    movie_url_list = []

    for tag in tags_list['tags']:
        # 循环遍历分类信息
        data = {'tag': tag}
        # 组装新的url
        m_url = movie_url % parse.urlencode(data)
        movie_url_list.append(m_url)
    
    # 启动多线程
    while True:
        # 如果movie_url_list有值
        if movie_url_list:
            a1 = GetMovie()
            a2 = GetMovie()

            a1.start()
            a2.start()
        else:
            break
```

GIL

**全局解释器锁**（英语：Global Interpreter Lock，缩写**GIL**），是[计算机程序设计语言](https://zh.wikipedia.org/wiki/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%A8%8B%E5%BA%8F%E8%AE%BE%E8%AE%A1%E8%AF%AD%E8%A8%80)[解释器](https://zh.wikipedia.org/wiki/%E8%A7%A3%E9%87%8A%E5%99%A8)用于[同步](https://zh.wikipedia.org/wiki/%E5%90%8C%E6%AD%A5)[线程](https://zh.wikipedia.org/wiki/%E7%BA%BF%E7%A8%8B)的一种机制，它使得任何时刻仅有一个线程在执行。常见例子有[CPython](https://zh.wikipedia.org/wiki/CPython)（[Jython](https://zh.wikipedia.org/wiki/Jython)不使用GIL）与[Ruby MRI](https://zh.wikipedia.org/wiki/Ruby)。

- CPython的线程是[操作系统](https://zh.wikipedia.org/wiki/%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F)的原生线程。在[Linux](https://zh.wikipedia.org/wiki/Linux)上为pthread，在[Windows](https://zh.wikipedia.org/wiki/Windows)上为Win thread，完全由操作系统调度线程的执行。一个Python解释器进程内有一个主线程，以及多个用户程序的执行线程。即便使用[多核心CPU](https://zh.wikipedia.org/wiki/%E5%A4%9A%E6%A0%B8%E5%BF%83CPU)平台，由于GIL的存在，也将禁止多线程的并行执行。[[1\]](https://zh.wikipedia.org/wiki/%E5%85%A8%E5%B1%80%E8%A7%A3%E9%87%8A%E5%99%A8%E9%94%81#cite_note-1)
- Python解释器进程内的多线程是以协作多任务方式执行。当一个线程遇到[I/O](https://zh.wikipedia.org/wiki/I/O)任务时，将释放GIL。计算密集型（CPU-bound）的线程在执行大约100次解释器的计步（ticks）时，将释放GIL。计步（ticks）可粗略看作Python虚拟机的指令。计步实际上与时间片长度无关。可以通过sys.setcheckinterval()设置计步长度。
- 在单核CPU上，数百次的间隔检查才会导致一次线程切换。在多核CPU上，存在严重的线程颠簸（thrashing）。
- Python 3.2开始使用新的GIL。新的GIL实现中用一个固定的超时时间来指示当前的线程放弃全局锁。在当前线程保持这个锁，且其他线程请求这个锁时，当前线程就会在5毫秒后被强制释放该锁。
- 可以创建独立的进程来实现并行化。Python 2.6引进了多进程包multiprocessing。或者将关键组件用[C](https://zh.wikipedia.org/wiki/C%E8%AF%AD%E8%A8%80)/[C++](https://zh.wikipedia.org/wiki/C%2B%2B)编写为Python扩展，通过ctypes使Python程序直接调用C语言[编译](https://zh.wikipedia.org/wiki/%E7%BC%96%E8%AF%91)的[动态链接库](https://zh.wikipedia.org/wiki/%E5%8A%A8%E6%80%81%E9%93%BE%E6%8E%A5%E5%BA%93)的导出函数。



RabbitMQ





```
driver.execute_script("window.scrollBy(0,200)","")  #向下滚动200px
driver.execute_script("window.scrollBy(0,document.body.scrollHeight)","")  #向下滚动到页面底部  
```
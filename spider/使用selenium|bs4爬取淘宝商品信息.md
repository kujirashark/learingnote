>作者:李忠林
>
>Github: <https://github.com/Leezhonglin>
>
>Gitblog: https://leezhonglin.github.io/

​	使用自动化测试库,来模拟浏览器获取淘宝搜索页面的相关信息.首先我们需要安装selenium | BeautifulSoup4 |  pymongo 库.安装方法.

```python
pip install selenium

pip install beautifulsoup4

pip install pymongo
```

安装好之后我们需要检查一下是否的都安装成功.检查方法在虚拟环境中输入

```python
(venv) deMacBook-Pro:spider00 lizhonglin$ pip freeze 

selenium==3.13.0
beautifulsoup4==4.6.0
pymongo==3.7.0
```

能看见这几个东西就表明我们的库已经成功安装了.

接下来我们就可以开始我们的代码了.首先我们要理清楚解决问题的思路.有了思路了才能开始写我们的代码.  分析问题— — >获取解决问题的方法— — > 解决问题.就有了我们下面的代码.

```python
import time
from selenium import webdriver
from bs4 import BeautifulSoup
from pymongo import MongoClient


def save_data_mongodb(data):
    """
    保存数据到mongodb
    :param data: 传入需要保存的数据
    :return: 无
    """
    # 链接数据库
    conn = MongoClient('mongodb://127.0.0.1:27017')
    # 切换到taobao的数据库
    db = conn.taobao
    # 插入数据
    db.goods_info.insert(data)


def parse_taobao_goods_info_html(html):
    """
    解析页面信息
    :param html: 需要解析的页面
    """
    soup = BeautifulSoup(html, 'lxml')
    div_list = soup.find_all('div', 'J_MouserOnverReq')
    for div in div_list:
        # 获取图片和名称
        imgs = div.find('img', 'J_ItemPic')
        image_link = 'https:' + imgs.attrs.get('data-src')
        name = imgs.attrs.get('alt')
        # print('商品图片链接:'+image_link)
        # print('商品名称:'+ name)
        # 获取商品的价格
        price = div.find('div', 'g_price-highlight').find('strong').text
        # print('价格:'+price)
        # 获取商品的销量
        sales = div.find('div', 'deal-cnt').text.split('人')[0]
        # print('销量:'+ sales)
        # 获取商品地区信息
        location = div.find('div', 'location').text
        # print('地区:'+ location)
        # 获取商家信息
        try:
            business_info = div.find('a', 'shopname').find_all('span')[-1].text
        except:
            business_info = div.find('a', 'shopname').text

        # print('商家信息:' + business_info)
        result = {
            'name': name,
            'image_link': image_link,
            'price': price,
            'sales': sales,
            'location': location,
            'business_info': business_info
        }
        # 插入数据
        save_data_mongodb(result)


def get_taobao_html(url, keyword):
    """
    爬取原始页面
    :param url: 爬取页面的url
    :param keyword:  需要爬取的关键字
    :return: 爬取完的所有数据
    """
    browser = webdriver.Chrome()
    browser.get(url)
    time.sleep(3)
    # 模拟在输入框内输入数据
    browser.find_element_by_id('q').send_keys(keyword)
    time.sleep(4)
    # 模拟点击搜索
    browser.find_element_by_class_name('btn-search').click()
    time.sleep(2)

    # 获取到有多少页的搜索结果
    total_page = browser.find_element_by_xpath('//*[@id="mainsrp-pager"]/div/div/div/div[1]').text.split()[1]
    # 获取页面资源
    print('正在获取第一页数据')
    html_source_one = browser.page_source
    time.sleep(8)
    # print(html_source_one)
    print('正在解析第一页数据')
    parse_taobao_goods_info_html(html_source_one)
    time.sleep(8)
    print('第一页数据插入完成')

    # for page in range(int(total_page)):
    for page in range(4):
        # 判断右下角页面输入框的值,来确定当前页
        current_page = int(
            browser.find_element_by_xpath('//*[@id="mainsrp-pager"]/div/div/div/div[2]/input').get_attribute('value'))
        if current_page != page:
            bottom = "window.scrollTo(0, document.body.scrollHeight)"
            browser.execute_script(bottom)
            time.sleep(1)
            # 修改要爬取的页面值
            browser.find_element_by_xpath('//*[@id="mainsrp-pager"]/div/div/div/div[2]/input').clear()
            browser.find_element_by_xpath('//*[@id="mainsrp-pager"]/div/div/div/div[2]/input').send_keys(current_page)
            # 提交要爬取的页面
            browser.find_element_by_xpath('//*[@id="mainsrp-pager"]/div/div/div/div[2]/span[3]').click()
            time.sleep(3)
            print('++++++' * 10)
            print('正在获取第%d页数...' % current_page)
            # 获取当前页面的源码
            html_source = browser.page_source
            time.sleep(8)
            # 解析获取的页面
            print('正在解析第%d页数...' % current_page)
            parse_taobao_goods_info_html(html_source)
            time.sleep(8)
            print('第%d页数据插入完成......' % current_page)
    browser.close()


if __name__ == '__main__':
    keyword = input('请输入要搜索的关键字:')
    url = 'https://www.taobao.com/'
    get_taobao_html(url, keyword)

```






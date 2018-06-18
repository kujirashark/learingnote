#### Web框架

---

###### 常见的框架有

```
Flask		Django		Tornado		Pyramid		Bottle		Web2py		web.py
```

###### mvc架构

```
-- model
-- controller
-- view
数据和数据的解耦合

MVC：模型-视图-控制器
目标：模型（数据）和视图（显示）解耦合
```

![9A163A7E421E04FD77B1807356B447](/Users/lizhonglin/Library/Containers/com.tencent.qq/Data/Library/Caches/Images/E9A163A7E421E04FD77B1807356B447F.jpg)

通过控制器，将数据和显示分离，好处是同一个视图可以加载不同的模型，同一个模型也可以显示成不同的视图

稍具规模的系统都会使用MVC架构或者它的变体（MVP、MVVM等）

它是对面向对象设计原则中迪米特法则的一个最好的践行

###### python中的的模式

![CAC360BC60D562BC3E621664BF9ABB](/Users/lizhonglin/Library/Containers/com.tencent.qq/Data/Library/Caches/Images/5CAC360BC60D562BC3E621664BF9ABBB.jpg)

##### Windows中django操作

###### 1，检查python的版本

```
python --version
python --version
```

###### 2，创建虚拟环境

```
python -m venv  hello_django_venv
```

###### 3, 	进入文件夹

```
cd hello_django_venv
激活虚拟环境
cd srcipts      
deactivate (不激活)
```

###### 4,	安装django框架

```
pip install django  版本(指定版本就加上)      {==1.11   (==指定版本)}
```

###### 5,检查django的版本

```
django-admin --version
/Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6
```

###### 6, 创建项目

```
django-admin startproject hello_django
```

###### 7,进入项目目录

```
python manage.py runserver  启动服务

```



##### Macos\linux下面创建django虚拟环境

```
1,mkdir hello_django     		创建项目目录
2,cd hello_django/       		切换到项目目录
3,python3 -m venv hd_venv 		使用venv模块创建虚拟环境，目录名hd_venv
4,source hd_venv/bin/activate    激活虚拟环境 
5,python -m pip install --upgrade pip  更新pip到最新版本
6,pip install django              使用pip安装django
7,django-admin --version       通过安装django时安装的脚本工具django-admin检查django版本
8,在虚拟环境下面创建项目
	django-admin startproject hello_django
9,启动服务
	python manage.py runserver  启动服务
    ctrl+c 停服务
    
10,建应用
   python manage.py startapp hrs
   
11,注册功能
# 下面的列表容器表示项目中安装了哪些应用
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'hrs',
    'crms',
    'sysms',
]
12,修改view.py文件
13,配置urls.py
```

###### 配置文件

```

#国际化
USE_I18N = True
#本地化
USE_L10N = True

USE_TZ = True

#保证存储到数据库中的是 UTC 时间；
#在函数之间传递时间参数时，确保时间已经转换成 UTC 时间；

```

###### 查看你已经更改了那个配置项

```
python manage.py diffsettings
```

###### 配置网站静态资源

```
STATIC_URL = '/static/'   配置静态资源

{% load static %}     加载静态资源

原文:https://docs.djangoproject.com/en/2.0/howto/static-files/

```

###### 连接数据库

```
1,配置数据库
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'oa',
        'HOST':'localhost',
        'PORT': '3306',
        'USER': 'root',
        'PASSWORD': '123456'
        
    }
}

2,安装依赖库
pip install pymysql

3,配置__init__

```

![mage-20180522100120](/var/folders/v9/jcddlqfx4tg9c57c6xvt8gyr0000gn/T/abnerworks.Typora/image-201805221001203.png)

```
4.执行
python manage.py migrate  迁移工具  (可以自动建表)
```



```
生成迁移
python manage.py makemigrations hrs   

执行迁移
python manage.py migrate      
```

> 两个一对多 取代多对多



###### 创建Django超级管理员

```
^C(venv) lizhonglindeMacBook-Pro:oa lizhonglin$ python manage.py createsuperuser 
Username (leave blank to use 'lizhonglin'): admin
Email address: admin@126.com
Password: 
Password (again): 
This password is too short. It must contain at least 8 characters.
This password is too common.
This password is entirely numeric.
Password: 
Password (again): 
Superuser created successfully.
(venv) lizhonglindeMacBook-Pro:oa lizhonglin$ 

```

###### 注册admin.py

```
例如:
from django.contrib import admin

from cart.models import Goods


class GoodsAdmin(admin.ModelAdmin):
    list_display = ('id','name','price','image')
    search_fields = ('name',)
    
admin.site.register(Goods,GoodsAdmin)
```

###### 项目中的shell

```
python manage.py shell
```

###### 增	删	改	查

```
创建一个部门
dept = Dept(no='90',name='研发二部',location='武汉')

获取一个部门
Dept.objects.get(pk=20)  获取一个

获取所有
Dept.object.all()

保存
dept.save()  

删除
dept.delect() 


```

表格 :

| no   | name     | location |
| ---- | -------- | -------- |
| 10   | 技术二部 | 武汉     |
| 20   | 行政部   | 成都     |
| 30   | 销售部   | 重庆     |
| 40   | 综合部   | 成都     |
| 60   | 网络部   | 成都     |
|      |          |          |

```
python manage.py shell  

精确查询某个部门
Dept.objects.filter(name='行政部')

模糊查询
>>> Dept.objects.filter(name__contains='网')
<QuerySet [<Dept: 网络部>]>
>>> 

忽略大小写模糊查询
>>> Dept.objects.filter(name__icontains='网')

查询大于30的部门
>>> Dept.objects.filter(no__gt=30)
<QuerySet [<Dept: 综合部>, <Dept: 网络部>]>

查询到大于等于30的部门
>>> Dept.objects.filter(no__gte=30)
<QuerySet [<Dept: 销售部>, <Dept: 综合部>, <Dept: 网络部>]>

倒叙查询所有
>>> Dept.objects.all().order_by('-no')


切片查询
>>> Dept.objects.all().order_by('no')[0:3]
<QuerySet [<Dept: 技术二部>, <Dept: 行政部>, <Dept: 销售部>]>
>>> 

原始查询
>>> Dept.objects.raw('select name from tb_dept')
<RawQuerySet: select name from tb_dept>

查询小于30的部门
>>> Dept.objects.filter(no__lt=30)
<QuerySet [<Dept: 技术二部>, <Dept: 行政部>]>
>>> 

删除部门
>>> Dept.object.get(pk=30).delect()

```

###### django配置日志

```
#配置日志输出到控制台

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['console'],
            'level': os.getenv('DJANGO_LOG_LEVEL', 'DEBUG'),
        },
    },
}
```

###### request

```
request.META     获取请求头的东西和本机的东西
request.POST
request.GET      获取使用GET请求的参数
```



```
查询这个部门的所有员工

1, Emp.objects.filter(dept__no=no) 

反向查询
先查询部门在查部门的员工 建表的时候可以加在ForeignKey中related_name 
related_name="+" 阻止反向查询
2, Dept.object.filter(no=no).emp_set.all()  

3 .select_related('dept')

```

###### QuerySet知识点

QuerySet 使用的是惰性查询  ===如果不是非要取数据的时候就不会去取数据,要用到数据的时候才会去取数据.这样做是为了节省服务器的内存开销(延迟开销)   节省空间的---消耗时间

数据量大的时候先:筛选—排序—切片 .select_related

> 写程序要尽量避免硬代码\硬编码

###### 配置URL

```
django1.x版本
命名捕获组 URL('emps/(?P<NAME>[0-9]+)',views.emps

diango2.x版本
path('emps/<int:no>',views.emps,name='empsindept'),
```

---

##### 

---


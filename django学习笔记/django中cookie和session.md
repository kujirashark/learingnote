>作者:李忠林
>
>github: https://github.com/Leezhonglin
>
>日期: 2018年5月15日



##### django中的cookie和session

>###### cookie（储存在用户本地终端上的数据）
>
>Cookie，有时也用其复数形式 [Cookies](https://baike.baidu.com/item/Cookies/187064)，指某些网站为了辨别用户身份、进行 session 跟踪而储存在用户本地终端上的数据（通常经过加密）。定义于 RFC2109 和 2965 中的都已废弃，最新取代的规范是 RFC6265 [1][ ]() 。（可以叫做浏览器缓存）

>###### session（计算机语言）
>
>:在计算机中，尤其是在网络应用中，称为“会话控制”。Session 对象存储特定用户会话所需的属性及配置信息。这样，当用户在应用程序的 Web 页之间跳转时，存储在 Session 对象中的变量将不会丢失，而是在整个用户会话中一直存在下去。当用户请求来自应用程序的 Web 页时，如果该用户还没有会话，则 Web 服务器将自动创建一个 Session 对象。当会话过期或被放弃后，服务器将终止该会话。Session 对象最常见的一个用法就是存储用户的首选项。例如，如果用户指明不喜欢查看图形，就可以将该信息存储在 Session 对象中。有关使用 Session 对象的详细信息，请参阅“ASP 应用程序”部分的“管理会话”。注意 会话状态仅在支持 cookie 的浏览器中保留。



###### 用户跟踪的三种技术

> 1.cookie   请求头             <最常用>
>
> 2.url重写   地址栏
>
> 3.隐藏域/隐式表单域   表达提交



###### 执行表单额外的验证

方法名必须以clean_开头.这个方法是自动执行的.

```
#例如:
class CarRecordForm(forms.ModelForm):
    carno = forms.CharField(min_length=7, max_length=7, label='车牌号', 									error_messages={'carno': '请输入有效的车牌号'})
    reason = forms.CharField(max_length=50, label='违章原因')
    punish = forms.CharField(max_length=50, required=False, label='处罚方式')

    """
    # 执行额外的表单数据验证
    def clean_carno(self):
        _carno = self.cleaned_data['carno']
        if not condition:
            raise forms.ValidationError('...')
        return _carno
    """
```

> 如果是GET请求可以给初始数据.需要使用:initial={} 初始数据没有填写完整

###### cookie

```
#cookie是保存在浏览器的临时文件中的用户数据(通常是识别用户的ID/token或者是用户的偏好设置).

#因为在每次请求服务器时在HTTP请求的请求头中都会携带本网站的Cookie数据

#那么服务器就可以获取这些信息来识别用户的身份或者了解用户的偏好 这就是所谓的用户跟踪

#因为HTTP本身是无状态的 所有需要使用Cookie/隐藏域/url重写这样的技术实现用户跟踪

#从请求中读取指定的cookie  — 通过cookie的名字找到对应的值

#如果请求中没有指定名字的cookie可以通过get方法的第二个参数设置一个默认的返回值

#当下次请求的时候会通过请求头的时候传给服务器对比.对比上才能登陆.如果任意一边丢失都会重新登陆
```

###### session

    #通过request对象的session属性可以获取到session
    # session相当于是服务器端用来保存用户数据的一个字典
    # session利用了Cookie保存sessionid
    # 通过sessionid就可以获取与某个用户对应的会话(也就是用户数据)
    # 如果在浏览器中清除了Cookie那么也就清除了sessionid
    # 再次访问服务器时服务器会重新分配新的sessionid这也就意味着之前的用户数据无法找回
    # 默认情况下Django的session被设定为持久会话而非浏览器续存期会话
    # 通过SESSION_EXPIRE_AT_BROWSER_CLOSE和SESSION_COOKIE_AGE参数可以修改默认设定
    # Django中的session是进行了持久化处理的因此需要设定session的序列化方式
    # 1.6版开始Django默认的session序列化器是JsonSerializer
    # 可以通过SESSION_SERIALIZER来设定其他的序列化器(例如PickleSerializer)
    (例如:SESSION_SERIALIZER = 'django.contrib.sessions.serializers.PickleSerializer')

###### 项目中的cookie
###### 项目中的cookie

案例:记录用户的上次访问时间

```
def ajax_search(request):
    current_time = datetime.now().ctime()
    # Cookie是保存在浏览器临时文件中的用户数据(通常是识别用户身份的ID/token或者是用户的偏好设置)
    # 因为每次请求服务器时在HTTP请求的请求头中都会携带本网站的Cookie数据
    # 那么服务器就可以获取这些信息来识别用户身份或者了解用户的偏好 这就是所谓的用户跟踪
    # 因为HTTP本身是无状态的 所以需要使用Cookie/隐藏域/URL重写这样的技术来实现用户跟踪
    # 从请求中读取指定的cookie - 通过cookie的名字找到对应的值
    # 如果请求中没有指定名字的cookie可以通过get方法的第二个参数设置一个默认的返回值
    last_visit_time = request.COOKIES.get('last_visit_time')
    if request.method == 'GET':
        response = render(request, 'search2.html',
                          {'last': last_visit_time if last_visit_time
                           else '你是第一次访问我们的网站'})
        # 通过render渲染页面后先用set_cookie方法设置cookie后再返回HttpResponse对象
        # 第一个参数是cookie的名字 第二个参数是cookie的值 第三个参数是过期时间(秒)
        response.set_cookie('last_visit_time', current_time, max_age=MAX_AGE)
        return response
    else:
        carno = request.POST['carno']
        record_list = list(CarRecord.objects.filter(carno__icontains=carno))
        # 第一个参数是要转换成JSON格式(序列化)的对象
        # encoder参数要指定完成自定义对象序列化的编码器(JSONEncoder的子类型)
        # safe参数的值如果为True那么传入的第一个参数只能是字典
        # return HttpResponse(json.dumps(record_list), content_type='application/json; charset=utf-8')
        return JsonResponse(record_list, encoder=CarRecordEncoder,
                            safe=False)


def search(request):
    # 请求行中的请求命令
    # print(request.method)
    # 请求行中的路径
    # print(request.path)
    # 请求头(以HTTP_打头的键是HTTP请求的请求头)
    # print(request.META)
    # 查询参数: http://host/path/resource?a=b&c=d
    # print(request.GET)
    # 表单参数
    # print(request.POST)
    if request.method == 'GET':
        ctx = {'show_result': False}
    else:
        carno = request.POST['carno']
        ctx = {
            'show_result': True,
            'record_list': list(CarRecord.objects.filter(carno__contains=carno))}
    return render(request, 'search.html', ctx)
```



##### Django项目完整步骤:

###### 1.建项目

###### 2.安装pymysql

###### 3.在项目文件夹下面的__init__ 配置pymysql

```
在项目文件夹下面的__init__ 配置pymysql
import pymysql
pymysql.install_as_MySQLdb()
```

###### 4.配置INSTALLED_APPS

```
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'cart.apps.CartConfig',
]

中间件 位于浏览器和服务器中间
过滤拦截器
拦截请求和响应
HttpResonse
拦截下来 附加额外的操作
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]
```

###### 5数据库的配置

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'shop',
        'HOST':'127.0.0.1',
        'POST':'3306',
        'USER':'root',
        'PASSWORD':'123456'
    }
}
```

###### 6配置静态资源

```
STATICFILES_DIRS = [os.path.join(BASE_DIR,'static'),]
STATIC_URL = '/static/'
```

###### 7配置时区/语言

```
LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Chongqing'
```

###### 8配置url

```
from cart import views

urlpatterns = [
    path('',views.index),
    path('add_to_cart/<int:id>',views.add_to_cart),
    path('show_cart',views.show_cart),
    path('admin/', admin.site.urls),
]
```

###### 9写视图

```
from django.shortcuts import render

def index(request):
    pass


def add_to_cart(request):
    pass

def show_cart(request):
    pass

```

###### 10 建立models

```
from django.db import models

class Goods(models.Model):
    """商品模型类"""
    id = models.AutoField(primary_key=True,db_column='gid')
    name = models.CharField(max_length=50,db_column='gname')
    price = models.DecimalField(max_digits=10,decimal_places=2,db_column='gprice')
    image = models.CharField(max_length=255,db_column='gimage')
    class Meta:

        db_table = 'tb_goods'
        ordering = ('id',)

```

###### 11迁移

```
python manage.py makemigrations cart   
python manage.py migrate
```

###### 12注册后台管理员账户

```
例如:
from django.contrib import admin

from cart.models import Goods


class GoodsAdmin(admin.ModelAdmin):
    list_display = ('id','name','price','image')
    search_fields = ('name',)
    
admin.site.register(Goods,GoodsAdmin)
    

```

###### 13:GUANLIY

```
(venv) lizhonglindeMacBook-Pro:shop lizhonglin$ python manage.py createsuperuser 
Username (leave blank to use 'lizhonglin'): admin
Email address: admin@126.com
Password: 
Password (again): 
Superuser created successfully.
(venv) lizhonglindeMacBook-Pro:shop lizhonglin$ 

```

###### 14进入管理员界面查看数据

```
可以插入数据
```

###### 15配置url

```
配置首页
def index(request):
    good_list = list(Goods.objects.all())
    return render(request,'goods.html',{'goods_list':good_list})
```


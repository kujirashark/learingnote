>作者:李忠林
>
>Github: https://github.com/Leezhonglin
>
>日期: 2018年6月5日



##### 文件上传的知识点

###### django之对FileField字段的upload_to的设定

用django开发，经常要处理用户上传的文件， 比如user模型里面如果又个人头像的字段 ImageField等等，而django在FielField字段（包括ImageField）的支持和扩展是做的很好的，首先一个问题，是上传的文件，django是放到哪里去了，（note： 文件流是不会放到数据库里面的，该字段在数据库中只存储路径），django提供了upload_to属性 
 	以下介绍upload_to的具体使用方法

###### 1.最直接的方式，硬编码路径

```
# 在项目的settings.py 里面设置MEDIA_ROOT and MEDIA_URL
        
# 1. media路径
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')


# 2. 设置完后在项目的URL文件中配置一下
# 把media做成静态目录
urlpatterns += static(MEDIA_URL,document_root = MEDIA_ROOT)
```

这样配置成功后上传好文件了就会在项目的根目录下面自动创建一个media的文件夹保存上传后的文件了.

```
# 模型
class UesrModel(models.Model):
    username = models.CharField(max_length=32, unique=True)
    password = models.CharField(max_length=256)  # 密码
    email = models.CharField(max_length=64, unique=True)
    # False 代表女
    sex = models.BooleanField(default=False)  # 性别
    icon = models.ImageField(upload_to='icons')  # 头像
    is_delete = models.BooleanField(default=False)  # 是否删除
```

最终完成后的效果就是/media/icons/xxx.jpg 的图片路径.

前端页面在提交表单的时候一定要添加enctype属性:

```
<form method="post" action="" enctype="multipart/form-data" >
</form>
```

后端获取的时候使用request.FILES.GET('name').例如:

```
icon = request.FILES.get('icon')
```


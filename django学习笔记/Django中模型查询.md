>作者:李忠林
>
>github: https://github.com/Leezhonglin
>
>日期: 2018年5月5日



### Django中模型查询

##### 1，定义属性

Django根据属性的类型确定以下信息：

- 当前选择的数据库支持字段的类型
- 渲染管理表单时使用的默认html控件
- 在管理站点最低限度的验证

django会为表创建自动增长的主键列，每个模型只能有一个主键列，如果使用选项设置某属性为主键列后django不会再创建自动增长的主键列。

- 默认创建的主键列属性为id，可以使用pk代替，pk全拼为primary key。
- 注意：pk是主键的别名，若主键名为id2，那么pk是id2的别名。

属性命名限制：

- 不能是python的保留关键字。
- 不允许使用连续的下划线，这是由django的查询方式决定的
- 定义属性时需要指定字段类型，通过字段类型的参数指定选项，语法如下： 
  **属性=models.字段类型(选项)**

##### 2，字段类型

使用时需要引入django.db.models包，字段类型如下：

- AutoField：自动增长的IntegerField，通常不用指定，不指定时Django会自动创建属性名为id的自动增长属性。
- BooleanField：布尔字段，值为True或False。
- NullBooleanField：支持Null、True、False三种值。
- CharField(max_length=字符长度)：字符串。 
  参数max_length表示最大字符个数。
- TextField：大文本字段，一般超过4000个字符时使用。
- IntegerField：整数。
- DecimalField(max_digits=None, decimal_places=None)：十进制浮点数。 
  ++ 参数max_digits表示总位数。 
  ++ 参数decimal_places表示小数位数。
- FloatField：浮点数。
- DateField[auto_now=False, auto_now_add=False])：日期。 
  ++ 参数auto_now表示每次保存对象时，自动设置该字段为当前时间，用于”最后一次修改”的时间戳，它总是使用当前日期，默认为false。 
  ++ 参数auto_now_add表示当对象第一次被创建时自动设置当前时间，用于创建的时间戳，它总是使用当前日期，默认为false。 
  ++参数auto_now_add和auto_now是相互排斥的，组合将会发生错误。
- TimeField：时间，参数同DateField。
- DateTimeField：日期时间，参数同DateField。
- FileField：上传文件字段。
- ImageField：继承于FileField，对上传的内容进行校验，确保是有效的图片。

##### 3，选项

通过选项实现对字段的约束，选项如下：

- null：如果为True，表示允许为空，默认值是False。
- blank：如果为True，则该字段允许为空白，默认值是False。
- 对比：null是数据库范畴的概念，blank是表单验证证范畴的。
- db_column：字段的名称，如果未指定，则使用属性的名称。
- db_index：若值为True, 则在表中会为此字段创建索引，默认值是False。
- default：默认值。
- primary_key：若为True，则该字段会成为模型的主键字段，默认值是False，一般作为AutoField的选项使用。
- unique：如果为True, 这个字段在表中必须有唯一值，默认值是False。

##### 4，字段查询

all():返回模型类对应表格中的所有数据。 
例：查询图书所有信息。 
BookInfo.objects.all();->select * from booktest_bookinfo;

get():返回表格中满足条件的一条数据。 
如果查到多条数据，则抛异常：MultipleObjectsReturned 
查询不到数据，则抛异常：DoesNotExist 
例：查询图书id为3的图书信息。 
BookInfo.objects.get(id=3) –> select * from booktest_bookinfo where id = 3;

filter():参数写查询条件，返回满足条件QuerySet集合数据。 
条件格式： 
**模型类属性名**__条件名=值 
注意：此处是模型类属性名，不是表中的字段名

```
1.  判等 exact。
例：查询编号为1的图书。
BookInfo.object.filter(id=1)
BookInfo.object.filter(id__exact=1)此处的exact可以省略

2.  模糊查询 like
例：查询书名包含'传'的图书。contains
BookInfo.objects.filter(btitle__contains=’传’)
例：查询书名以'部'结尾的图书 endswith 开头:startswith
BookInfo.objects.filter(btitle__endswith=’部’)
BookInfo.objects.filter(btitle__startswith=’天’)

3.  空查询 where 字段名 isnull
例：查询书名不为空的图书。isnull
BookInfo.objects.filter(btitle__isnull=False)

4.  范围查询 where id in (1,3,5) 
例：查询编号为1或3或5的图书。In
BookInfo.objects.filter(id__in=[1,3,5])

5.  比较查询 gt lt(less than) gte(equal) lte
例：查询编号大于等于3的图书。
BookInfo.objects.filter(id__gte=3)

6.  日期查询
例：查询1980年发表的图书。
BookInfo.objects.filter(bpub_date__year = 1980)
例：查询1980年1月1日后发表的图。
BookInfo.objects.filter(bpub_date__gt = date(1980,1,1))

7. exclude:返回不满足条件的数据。
例：查询id不为3的图书信息。
BookInfo.objects.exclude(id=3)123456789101112131415161718192021222324252627282930313233
```

##### 5，F对象

作用：用于类属性之间的比较条件。

```
使用之前需要先导入：
from django.db.models import F
例：查询图书阅读量大于评论量图书信息。where bread > bcomment
BookInfo.objects.filter(bread__gt = F(‘bcomment’))
例：查询图书阅读量大于2倍评论量图书信息。
BookInfo.objects.filter(bread__gt=F(‘bcomment’)*2)
```

##### 6，Q对象

作用：用于查询时的逻辑条件。可以对Q对象进行&|~操作。

```
使用之前需要先导入：
from django.db.models import Q
例：查询id大于3且阅读大于30的图书的信息。
BookInfo.objects.filter(id__gt=3, bread__gt=30)
BooInfo.objects.filter(Q(id__gt=3) & Q(bread__gt=3))
例：查询id大于3或者阅读大于30的图书的信息。
BookInfo.objects.filter(Q(id__gt=3) | Q(bread__gt=30))
例：查询id不等于3图书的信息。
BookInfo.objects.filter(~Q(id=3))123456789
```

##### 7，order_by 返回QuerySet

作用：进行查询结果进行排序。

```
例：查询所有图书的信息，按照id从小到大进行排序。
BookInfo.objects.all()order_by('id')
例：查询所有图书的信息，按照id从大到小进行排序。
BookInfo.objects.all().order_by('-id')
例：把id大于3的图书信息按阅读量从大到小排序显示；
BookInfo.objects.filter(id__gt=3).order_by('-bread')123456
```

##### 8，聚合函数

作用：对查询结果进行聚合操作。 
sum count max min avg 
aggregate：调用这个函数来使用聚合。

```
使用前需先导入聚合类：
from django.db.models import Sum,Count,Max,Min,Avg
例：查询所有图书的数目。select count(*) from booktest_bookinfo;
BookInfo.objects.aggregate(Count('id'))
{'id__count': 5} 注意返回值类型及键名
例：查询所有图书阅读量的总和。
BookInfo.objects.aggregate(Sum(‘bread’))
{‘bread__sum’:120}  注意返回值类型及键名12345678
```

count函数 
作用：统计满足条件数据的数目。

```
例：统计所有图书的数目。
BookInfo.objects.all().count()
例：统计id大于3的所有图书的数目。
BookInfo.objects.filter(id__gt = 3).count()1234
```

##### 9，查询相关函数返回值总结：

```
get:返回一个对象
all:QuerySet(也就是[])
filter:QuerySet
exclude:QuerySet
order_by:QuerySet
aggregate:字典
count:值1234567
```

##### 10，查询集

> all, filter, exclude, order_by调用这些函数会产生一个查询集，可以在查询集上继续调用这些函数。

查询集特性：

- 1）惰性查询：只有在实际使用查询集中的数据的时候才会发生对数据库的真正查询。
- 2）缓存：当使用的是同一个查询集时，第一次的时候会发生实际数据库的查询，然后把结果缓存起来，之后再使用这个查询集时，使用的是缓存中的结果。

限制查询集：

> 可以对一个查询集进行取下标或者切片操作来限制查询集的结果。

- b[0]就是取出查询集的第一条数据，
- b[0:1].get()也可取出查询集的第一条数据。
- 如果b[0]不存在，会抛出IndexError异常，
- 如果b[0:1].get()不存在，会抛出DoesNotExist异常。

> 对一个查询集进行切片操作会产生一个新的查询集，下标不允许为负数。

- exists:判断一个查询集中是否有数据。 
  有返回True，没有返回False

##### 11，模型类关系

1）一对多关系 
例：图书类-英雄类  
models.ForeignKey() 定义在多的类中。

2）多对多关系 
例：新闻类-新闻类型类  
models.ManyToManyField() 定义在哪个类中都可以。

3）一对一关系 
例：员工基本信息类-员工详细信息类 
models.OneToOneField() 定义在哪个类中都可以。

##### 12，关联查询（一对多）

在一对多关系中，一对应的类我们把它叫做一类，多对应的那个类我们把它叫做多类，我们把多类中定义的建立关联的类属性叫做关联属性。

###### A、通过对象执行关联查询

```
例：查询图书id为1的所有英雄的信息。
    b = BookInfo.objects.get(id=1)
    b.heroinfo_set.all()

例：查询id为1的英雄所属图书信息。
    h = HeroInfo.objects.get(id=1)
    h.hbook
    h.hbook_id12345678
```

格式：

- 由一类的对象查询多类的时候：

  > 一类的对象.多类名小写_set.all() #查询所用数据

- 由多类的对象查询一类的时候：

  > 多类的对象.关联属性 #查询多类的对象对应的一类的对象

- 由多类的对象查询一类对象的id时候：

  > 多类的对象. 关联属性_id

###### B、通过模型类实现关联查询：

```
例：查询图书，要求图书中英雄的描述包含'八'。Join
BookInfo.objects.filter(heroinfo__hcomment__contains='八')

例：查询图书，要求图书中的英雄的id大于3.
BookInfo.objects.filter(heroinfo__id__gt=3)

例：查询书名为“天龙八部”的所有英雄。
HeroInfo.objects.filter(hbook__btitle = '天龙八部')12345678
```

格式：

- 通过多类的条件查询一类的数据：

```
一类名.objects.filter(多类名小写__多类属性名__条件名=值)1
```

- 通过一类的条件查询多类的数据：

```
多类名.objects.filter(关联属性__一类属性名__条件名=值)1
```

##### 13，自关联,特殊的一对多的关系

对于地区信息、分类信息等数据，表结构非常类似，每个表的数据量十分有限，为了充分利用数据表的大量数据存储功能，可以可以设计成一张表，内部的关系字段指向本表的主键，这就是自关联的表结构。

```
#定义地区模型类，存储省、市、区县信息
class AreaInfo(models.Model):
    atitle=models.CharField(max_length=30)

    # 关系属性使用self指向本类，要求null和blank允许为空，因为一级数据是没有父级的。

    aParent=models.ForeignKey('self',null=True,blank=True)1234567
```

##### 14，管理器

BookInfo.objects.all()->objects是一个什么东西呢？ 
答：objects是Django帮我自动生成的管理器，通过这个管理器可以实现对数据的查询。

objects是models.Manger类的一个对象。自定义管理器之后Django不再帮我们生成默认的objects管理器。

1)自定义一个管理器类，这个类集成models.Manger类。 
2)再在具体的模型类里定义一个自定义管理器类的对象。

> 自定义管理器类的应用场景：

- 1）改变查询的结果集。 
  比如调用BookInfo.books.all()返回的是没有删除的图书的数据。
- 2）在管理器类中定义一个方法帮我们创建对应的模型类对象。 
  使用self.model()就可以创建一个跟自定义管理器对应的模型类对象。

##### 15，元选项

Django默认生成的表名：

> 应用名小写_模型类名小写。

元选项：

> 需要在模型类中定义一个元类Meta,在里面定义一个类属性db_table就可以指定表名。

##### 16，管理器和元选项案例：

```
# 自定义一个管理器类
class BookInfoManager(models.Manager):
    # 重写父类的all函数, 返回数据表中没有删除的数据
# all filter order_by exclude都调用get_queryset()函数，单独重写

    #作用1：改变查询的结果集
    def all(self):
        # 1.调用父类的方法查询出所有图书 QuerySet
        res = super().get_queryset().all()
        # 2.对结果进行过滤
        return res.filter(isDelete=False)

    # 作用2：创建对应模型类的对象，并可以进行一些初始化值
    def create(self, btitle, bpub_date):
        # b = BookInfo()
        # 动态创建一个BookInfo类的对象，类名更改之后这句代码也不需要变化
        b = self.model()
        b.btitle = btitle
        b.bpub_date = bpub_date
        b.bread = 0
        b.bcomment = 0
        b.isDelete = False
        return b


# 一类
# 属性名 = models.字段类型(选项)
class BookInfo(models.Model):
    btitle = models.CharField(max_length=20, db_column='title')
    # btitle = models.CharField(max_length=20, unique=True, db_index=True) #图书标题
    bpub_date = models.DateField(auto_now_add=True)  # 出版日期
    bread = models.IntegerField(default=0)  # 阅读量
    bcomment = models.IntegerField(default=0)  # 评论数
    isDelete = models.BooleanField(default=False)  # 软删除

    # python自带的manager类管理器
    # books = models.Manager()
    # 自定义一个类管理起器对象
    objects = BookInfoManager()

    # 元选项
    class Meta:
        db_table = 'bookinfo'  # 指定表名，db_table不能变
```
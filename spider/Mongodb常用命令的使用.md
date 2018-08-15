Mongodb介绍:

​	来自[官网](https://www.mongodb.com/cn).

​	MongoDB（来自于英文单词“Humongous”，中文含义为“庞大”）是可以应用于各种规模的企业、各个行业以及各类应用程序的开源数据库。作为一个适用于敏捷开发的数据库，MongoDB的数据模式可以随着应用程序的发展而灵活地更新。与此同时，它也为开发人员 提供了传统数据库的功能：二级索引，完整的查询系统以及严格一致性等等。 MongoDB能够使企业更加具有敏捷性和可扩展性，各种规模的企业都可以通过使用MongoDB来创建新的应用，提高与客户之间的工作效率，加快产品上市时间，以及降低企业成本。

MongoDB是专为可扩展性，高性能和高可用性而设计的数据库。它可以从单服务器部署扩展到大型、复杂的多数据中心架构。利用内存计算的优势，MongoDB能够提供高性能的数据读写操作。 MongoDB的本地复制和自动故障转移功能使您的应用程序具有企业级的可靠性和操作灵活性。

##### Mongodb使用教程

如何安装:

列举MacOs的安装教程.macos非常方便可以使用[Homebrew](https://brew.sh/index_zh-cn)包管理工具安装.有了这个工具之后只需要一条命令就能安装好mongodb.

```
brew install mongodb
```

###### 启动 | 重启 | 停止MongoDB服务的命令

```
# 启动
brew services start mongodb
# 服务端
mongod
# 客户端
mongo

# 停止
brew services stop mongodb
# 重启
brew services restart mongodb
```



##### Mongodb常用命令：

###### 1、查询库、查询表

```mongodb
show dbs  //查询所有的数据库

show collections   //查询当前数据库下的所有数据表123

> // 显示所有数据库
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB

> // 创建并切换到spider数据库
> use spider
switched to db spider

> // 删除当前数据库
> db.dropDatabase()
{ "ok" : 1 }
```

注意：如果第一次use spider会创建spider数据库的，但是立马show dbs的时候，并不会展示出当前刚创建的spider的数据库，需要在该数据库下创建了文档才能show dbs看到spider数据库的。这点需要注意一下。



###### 2、建库和删库

```
> // 创建并切换到school数据库
> use school
switched to db school

> // 创建colleges集合
> db.createCollection('colleges')
{ "ok" : 1 }

> // 创建students集合
> db.createCollection('students')
{ "ok" : 1 }

> // 查看所有集合
> show collections
colleges
students

> // 删除colleges集合
> db.colleges.drop()
true
> 
```

###### 3、单表的增删改

```
db.myTable.insert({name:’hahaha’,age:12});  //新增

db.myTable.update({name:’hf’},{$set:{age:25}})  //修改

db.myTable.remove({name:’hf'});  //删除12345

> // 向students集合插入文档
> db.students.insert({s_id: 1, name: 'Lee', age: 18})
WriteResult({ "nInserted" : 1 })

> // 向students集合插入文档
> db.students.save({s_id: 2, name: 'Lee', tel: '12334566789', gender: '男'})
WriteResult({ "nInserted" : 1 })

> // 查看所有文档
> db.students.find()
{ "_id" : ObjectId("5b24b01f165a0f78dbf82a12"), "s_id" : 2, "name" : "Lee", "tel" : "12334566789", "gender" : "男" }
{ "_id" : ObjectId("5b24b0dc165a0f78dbf82a15"), "s_id" : 1, "name" : "Lee", "age" : 18 }

> // 更新s_id为1的文档
> db.students.update({'s_id':1}, {'$set':{'age':16}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })


> // 插入或更新s_id为3的文档
> db.students.update({s_id: 3}, {'$set': {name: 'jerry', tel: '13022221333', gender: '女'}},  upsert=true)
WriteResult({
        "nMatched" : 0,
        "nUpserted" : 1,
        "nModified" : 0,
        "_id" : ObjectId("5b24b30d4717832ad090f2f5")
})

> // 查询所有文档
> db.students.find().pretty()
{
	"_id" : ObjectId("5b24b01f165a0f78dbf82a12"),
	"s_id" : 2,
	"name" : "Lee",
	"tel" : "12334566789",
	"gender" : "男"
}
{
	"_id" : ObjectId("5b24b0ba165a0f78dbf82a14"),
	"s_id" : 2,
	"name" : "Lee",
	"tel" : "12334566789",
	"gender" : "男"
}
{
	"_id" : ObjectId("5b24b0dc165a0f78dbf82a15"),
	"s_id" : 1,
	"name" : "Lee",
	"tel" : "12334566786",
	"age" : 16
}
{
	"_id" : ObjectId("5b24b30d4717832ad090f2f5"),
	"s_id" : 3,
	"gender" : "女",
	"name" : "jerry",
	"tel" : "13022221333"
}
```

讲解:我们可以使用 find() 方法来查询指定字段的数据，将要返回的字段对应值设置为 1。但是除了 _id 你不能在一个对象中同时指定 0 和 1。否则同时制定0和1的话，会报错误的。



###### 4、查询

```
>> // 查询s_id大于2的文档只显示name和tel字段
> db.students.find({s_id: {'$gt': 2}}, {_id: 0, name: 1, tel: 1}).pretty()

>> // 查询s_id大于2的文档除了不显示name和tel字段的其他字段
> db.students.find({s_id:{'$gt':2}}, {s_id:0, name:0, _id:0})
{ "gender" : "女", "tel" : "13022221333" }

>> // 查询s_id大于2的文档只显示_id和name和tel字段
> db.students.find({s_id:{'$gt':2}}, {s_id:1, name:1, _id:1})
{ "_id" : ObjectId("5b24b30d4717832ad090f2f5"), "s_id" : 3, "name" : "jerry" }
```

 筛选查询：

```
>>// 查询学生文档跳过第1条文档只查1条文档
> db.students.find().skip(1).limit(1).pretty()
{
	"_id" : ObjectId("5b24b0ba165a0f78dbf82a14"),
	"s_id" : 2,
	"name" : "Lee",
	"tel" : "12334566789",
	"gender" : "男"
}


> // 对查询结果进行排序(1表示升序，-1表示降序)
> db.students.find().sort({s_id: -1})
{ "_id" : ObjectId("5b24b30d4717832ad090f2f5"), "s_id" : 3, "gender" : "女", "name" : "jerry", "tel" : "13022221333" }
{ "_id" : ObjectId("5b24b01f165a0f78dbf82a12"), "s_id" : 2, "name" : "Lee", "tel" : "12334566789", "gender" : "男" }
{ "_id" : ObjectId("5b24b0ba165a0f78dbf82a14"), "s_id" : 2, "name" : "Lee", "tel" : "12334566789", "gender" : "男" }
{ "_id" : ObjectId("5b24b0dc165a0f78dbf82a15"), "s_id" : 1, "name" : "Lee", "tel" : "12334566786", "age" : 16 }
```


# 1.写20个不同的类, 在类中要有构造方法,析构方法, 成员属性,成员方法
# 2.在20个类的基础上,每个类分别创建5不同的对象,使用对象进行属性的操作,方法的调用.
# 在实例化对象时,一定要属性型初始化赋值操作.
# 并且在执行时,所有的代码不能出错
#1.
class Nan:
    def __init__(self,name,age,height,tizhong,sex):
        self.name = name
        self.age = age
        self.height = height
        self.tizhong = tizhong
        self.sex = sex
    def run(self):
        print("%s经常去锻炼身体" % self.name)
    def __del__(self):
        print('这个是第一个的析构方法')
yu = Nan('张宇',18,180,100,'男')
print(yu.name)
yu.run()

#2.
class Cat:
    def __init__(self,name,sex,maose,eye,mouth):
        self.name = name
        self.sex = sex
        self.maose = maose
        self.eye = eye
        self.mouth = mouth
    def eat(self):
        print('%s是一只%s眼睛的猫,喜欢抓老鼠' %(self.name,self.eye))
    def __del__(self):
        print('这是第二个类的析构方法')

bosi = Cat('波斯','雄性','咖啡色','蓝','大')
print(bosi.sex)
bosi.eat()


#3.
class Shangping:
    def __init__(self,name,baozhiqi,guige,money,kouwei):
        self.name = name
        self.baozhiqi = baozhiqi
        self.guige = guige
        self.money = money
        self.kouwei = kouwei
    def  Sales(self):
        print('%s是一款%s毫升,销量非常不错的产品,它有%s的口味' %(self.name , self.guige ,self.kouwei))
    def __del__(self):
        print('这是第三个类的析构方法')

kele = Shangping('可乐',30,200,3,'蓝莓')
kele.Sales()
print(kele.baozhiqi)


#4;
class Watch:
    def __init__(self,xinghao,yanse,number,biaopan,name):
        self.xinghao = xinghao
        self.yanse = yanse
        self.number = number
        self.biaopan = biaopan
        self.name = name
    def Looktime(self):
        print("%s是一款非常不错的智能手表,它有%s" %(self.name , self.yanse))
    def __del__(self):
        print('这是第四个类的构造方法')

apple = Watch('A-23s','black',2131,'圆形','Apple Watch 3')
apple.Looktime()
print(apple.number)

#5:
class Dog:
    def __init__(self,name,nose,food,eye,maose):
        self.name = name
        self.nose = nose
        self.food = food
        self.eye = eye
        self.maose = maose
    def wangwang(self):
        return '%s是一个非常忠诚的狗狗' %self.name
    def __del__(self):
        print('这是第五个类的构造方法')

jinmao = Dog('旺财','圆圆','狗粮','蓝','black')

print(jinmao.wangwang())
print(jinmao.food)

#6:
class Mal:
    def __init__(self,num1,num2,num3,num4,num5):
        self.num1 = num1
        self.num2 = num2
        self.num3 = num3
        self.num4 = num4
        self.num5 = num5
    def add(self):
        sum = self.num1 + self.num2 +self.num3 + self.num4 + self.num5
        return sum
    def __del__(self):
        print('这是第6个类的构造方法')

add = Mal(1,2,3,4,5)
print(add.add())
print(add.num5)

#7
class Classroom:
    def __init__(self,desk,room,dian,yizi,network):
        self.desk = desk
        self.room = room
        self.dian = dian
        self.yizi = yizi
        self.network = network
    def Dian(self):
        print('%s教室里面有很多%s'% (self.room ,self.desk))
    def __del__(self):
        print('这是第7个类的构造方法')
room = Classroom('书桌','1802',220,'靠背','互联网')
room.Dian()
print(room.network)

#8
class Animal:
    def __init__(self,name,age,food,tizhong,height):
        self.name = name
        self.age  = age
        self.food = food
        self.tizhong = tizhong
        self.height =height
    def Run(self):
        print('%s是跑得最快的动物' % self.name)
    def __del__(self):
        print('这是第8个类的析构方法')
cat = Animal('猎豹',3,'鸡腿',200,'200cm')
cat.Run()
print(cat.name)

#9
class Person:
    def __init__(self,name,sex,height,eye,toufa):
        self.name  = name
        self.sex = sex
        self.height = height
        self.eye = eye
        self.toufa = toufa
    def sleep(self):
        print('有着%s的%s是非常喜欢睡觉的' %(self.toufa ,self.name))
    def __del__(self):
        print('这是第九个类的构造方法')
xiaoming = Person('小明','男',180,'blue','金色')
xiaoming.sleep()
print(xiaoming.name)

#10
class sub:
    def __init__(self,a,b,c,d,e):
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
    def cha(self):
        f = self.a - self.b - self.c - self.d - self.e
        return f
    def __del__(self):
        print('这是第10个类的析构方法')
jia = sub(180,3,2,1,3)
print(jia.cha())
print(jia.d)

#11:
class GirlFriend:
    def __init__(self, name, height, age,yifu,nose):
        self.name = name
        self.height = height
        self.age = age
        self.yifu = yifu
        self.nose = nose
    def cooklie(self):
        print('%s做饭非常好吃' % self.name)
    def __del__(self):
        print('这是第11个类的析构方法')
hu = GirlFriend('merry', 163, 18,'裙子','高鼻梁')
print(hu.yifu)
hu.cooklie()

#12
class jisuan:
    def __init__(self,h,j,k,l,m):
        self.h = h
        self.j = j
        self.k = k
        self.l = l
        self.m = m
    def cha(self):
        y = self.h * self.j * self.k * self.l * self.m
        return y
    def __del__(self):
        print('这是第12个类的析构方法')
cheng = jisuan(4,3,2,1,3)
print(cheng.cha())
print(cheng.h)

#13
class Children:
    def __init__(self,name,age,weight,height,sex):
        self.name = name
        self.age = age
        self.weight = weight
        self.height = height
        self.sex = sex
    def works(self):
        print('%d岁的%s在家里认证写作业' %(self.age ,self.name))
    def __del__(self):
        print('这是第13个类的析构方法')
bob = Children('Bob',4,20,110,'男')
bob.works()
print(bob.height)


#14
class Repairs:
    def __init__(self,phone,watch,cpu,keyboard,mouse):
        self.phone = phone
        self.watch = watch
        self.cpu = cpu
        self.keyboard = keyboard
        self.mouse = mouse
    def Repair(self):
        return '这个修%s牌设备师傅真厉害!!' %self.keyboard
    def __del__(self):
        print('这是第14个类的析构方法')
chen = Repairs('apple','华为','inter','雷电','雷蛇')
print(chen.Repair())
print(chen.watch)

#15
class RepairHouse:
    def __init__(self,shuini,shazi,jiaju,mucai,shui):
        self.shuini = shuini
        self.shazi = shazi
        self.jiaju = jiaju
        self.mucai = mucai
        self.shui = shui
    def House(self):
        print('%s牌与%s牌是建房子的必须材料' % (self.shuini ,self.shazi))
    def __del__(self):
        print('这是第15个类的析构方法')
house = RepairHouse('西南水泥','大河','全友','柏木','自来水')
house.House()
print(house.mucai)

#16
class Supermarket:
    def __init__(self,shuiguo,tang,baihuo,mi,you):
        self.shuiguo = shuiguo
        self.tang = tang
        self.baihuo = baihuo
        self.mi = mi
        self.you = you
    def Top(self):
        print('%s是家中常用的食材' % self.mi)
    def __del__(self):
        print('这是第16个列的析构方法')
sale = Supermarket('苹果','巧克力糖','菜板','东北大米','橄榄油')
print(sale.mi)
print(sale.baihuo)

#17
class Bread:
    def __init__(self,juanshi,laiyou,niulai,wowo,rousong):
        self.juanshi = juanshi
        self.laiyou = laiyou
        self.niulai = niulai
        self.wowo = wowo
        self.rousong = rousong
    def Making(self):
        print('%s面包是最好吃的面包' % self.rousong)
    def __del__(self):
        print('这是第17个类的析构方法')
mian = Bread('卷式面包','奶油面包','牛奶面包','wowo面包','肉松面包')
print(mian.juanshi)
mian.Making()


#18
class Football:
    def __init__(self,name,qiuzheng,pingpai,yanse,neijing):
        self.name = name
        self.qiuzheng = qiuzheng
        self.pingpai = pingpai
        self.yanse = yanse
        self.neijing = neijing
    def Play(self):
        print('%s是直接参与人数最多的运动' %self.name)
    def __del__(self):
        print('这是第18个类的析构方法')
foot = Football('足球','难见','FIFA','red',18)
print(foot.name)
foot.Play()

##19
class Student:
    def __init__(self,name,banji,age,teacher,nianji):
        self.name =name
        self.banji = banji
        self.age = age
        self.teacher = teacher
        self.nianji = nianji
    def kaoshi(self):
        print('%s是他们%s考试考得最好的学生' %(self.name ,self.nianji))
    def __del__(self):
        print('这是第19个类的析构方法')
ji = Student('小陈',2,15,'吴老师','三年级')
print(ji.nianji)
ji.kaoshi()


##20
class Manfriend:
    def __init__(self,name,ear,hair,eyebrows,nose):
        self.name =name
        self.ear =ear
        self.hair =hair
        self.eyebrows =eyebrows
        self.nose =nose
    def hit(self):
        print('%s是一个有着%s的男士' %(self.name ,self.eyebrows))
    def __del__(self):
        print('这是最后一个类的析构方法')
man = Manfriend('吴京','大','black','浓','高鼻梁')
man.hit()
print(man.name)


















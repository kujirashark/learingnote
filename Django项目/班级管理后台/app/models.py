from django.db import models


class Grade(models.Model):
    g_name = models.CharField(max_length=20)
    g_create_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'grade'


class Student(models.Model):
    s_name = models.CharField(max_length=20, null=False, unique=True)
    s_create_time = models.DateTimeField(auto_now_add=True)
    s_img = models.ImageField(upload_to='upload', null=True)
    s_operate_time = models.DateTimeField(auto_now=True)
    g = models.ForeignKey(Grade)
    s_yuwen = models.IntegerField(null=True)
    s_shuxue = models.IntegerField(null=True)
    delete = models.BooleanField(default=False)


    class Meta:
        db_table = 'student'


# 创建班级的模型
class Grade2(models.Model):
    g_name = models.CharField(max_length=20)
    g_create_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'grade2'


# 创建学生的模型：
class Student2(models.Model):
    stu_name = models.CharField(max_length=6, unique=True)
    stu_sex = models.BooleanField(default=0)
    stu_birth = models.DateField()
    stu_delete = models.BooleanField(default=0)
    stu_create_time = models.DateField(auto_now_add=True)
    stu_operate_time = models.DateField(auto_now=True)
    stu_tel = models.CharField(max_length=11)
    stu_yuwen = models.DecimalField(max_digits=3, decimal_places=1, default=0)
    stu_shuxue = models.DecimalField(max_digits=3, decimal_places=1, default=0)
    g = models.ForeignKey(Grade2)

    class Meta:
        db_table = 'stu2'


# 创建学生拓展的模型：
class StuInfo(models.Model):
    stu_addr = models.CharField(max_length=30)
    stu_age = models.IntegerField()
    stu = models.OneToOneField(Student2)

    class Meta:
        db_table = 'stu_info'

# 1. 通过某个学生拓展表去获取学生信息
# 2. 通过学生表获取个人拓展表的信息
# 3. 获取python班下的所有学生的信息和拓展表的信息
# 4. 获取python班下语文成绩大于80分的女学生
# 5. 获取python班下语文成绩超过数学成绩10分的男学生
# 6. 获取出生在80后的男学生，查看他们的班级

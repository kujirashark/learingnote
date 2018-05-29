from django.db import models


class Grade(models.Model):
    g_name = models.CharField(max_length=20)
    g_create_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table='grade'


class Student(models.Model):
    s_name = models.CharField(max_length=20,null=False,unique=True)
    s_create_time = models.DateTimeField(auto_now_add=True)
    s_img = models.ImageField(upload_to='upload',null=True)
    s_operate_time = models.DateTimeField(auto_now=True)
    g = models.ForeignKey(Grade)

    class Meta:
        db_table='student'


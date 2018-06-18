from django.db import models

class Users(models.Model):

    username = models.CharField(max_length=10)
    password = models.CharField(max_length=200)
    ticket = models.CharField(max_length=30)
    create_time = models.DateTimeField(auto_now_add=True)
    login_time = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'user'


class Permission(models.Model):
    p_name = models.CharField(max_length=10)
    p_en = models.CharField(max_length=10)

    class Meta:
        db_table ='permission'

class Role(models.Model):
    r_name = models.CharField(max_length=10)
    u = models.OneToOneField(Users)
    r_p = models.ManyToManyField(Permission)

    class Meta:
        db_table = 'role'

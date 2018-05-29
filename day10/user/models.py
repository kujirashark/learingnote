from django.db import models

class Users(models.Model):

    username = models.CharField(max_length=10)
    password = models.CharField(max_length=200)
    ticket = models.CharField(max_length=30)
    create_time = models.DateTimeField(auto_now_add=True)
    login_time = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'user'


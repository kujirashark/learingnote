from django.conf.urls import url

from user import views

urlpatterns = [
    # # 注册
    # url(r'^register/', views.register, name='djregister'),
    # # 登录
    # url(r'^login/', views.login, name='djlogin'),
    # url(r'^logout/', views.logout, name='djlogout'),

    # 自己实现注册
    url(r'^register/', views.register, name='register'),
    # 登录
    url(r'^login/', views.login, name='login'),
    url(r'^logout/', views.logout, name='logout'),

]

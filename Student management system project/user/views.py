import random
from django.contrib import auth
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.core.urlresolvers import reverse
from user.models import Users

'''
注册页面处理
'''
"""django默认的注册登录"""


def djregister(request):
    if request.method == 'GET':
        return render(request, 'register.html')
    if request.method == 'POST':
        username = request.POST['username']
        pwd1 = request.POST['pwd1']
        pwd2 = request.POST['pwd2']

    # all()函数判断是否有空值,有空值返回True.
    if not all([username, pwd1, pwd2]):
        msg = '请填写完整数据'
        return render(request, 'register.html', {'msg': msg})
    if pwd1 != pwd2:
        msg = '两次密码不一致'
        return render(request, 'register.html', {'msg': msg})
    # 创建用户
    User.objects.create_user(username=username, password=pwd1)
    return HttpResponseRedirect(reverse('user:login'))


def djlogin(request):
    if request.method == 'GET':
        return render(request, 'login.html')

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        # 返回验证成功的登录信息
        user = auth.authenticate(username=username, password=password)
        if user:
            auth.login(request, user)
            return HttpResponseRedirect(reverse('app:index'))
        else:
            msg = '用户名或者密码错误'
            return render(request, 'login.html', {'msg': msg})


def djlogout(request):
    if request.method == 'POST':
        auth.logout(request)
        return HttpResponseRedirect(reverse('user:login'))


#################################################
"""
自定义登录注册
"""


def register(request):
    if request.method == 'GET':
        return render(request, 'register.html')
    if request.method == 'POST':
        username = request.POST['username']
        pwd1 = request.POST['pwd1']
        pwd2 = request.POST['pwd2']

    # all()函数判断是否有空值,有空值返回True.
    if not all([username, pwd1, pwd2]):
        msg = '注册信息不能为空'
        return render(request, 'register.html', {'msg': msg})
    if pwd1 != pwd2:
        msg = '两次密码不一致'
        return render(request, 'register.html', {'msg': msg})
    # 使用自定义的mdoels创建用户
    Users.objects.create(username=username, password=pwd1)
    # 成功返回用户登录页面
    return HttpResponseRedirect(reverse('user:login'))


def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        # 查询数据库中是否有页面传过来的用户
        user = Users.objects.filter(username=username, password=password).first()
        if user:
            # 先产生随机的字符串 ,长度为28
            s = 'qazwsxedcrfvtgbyhnujmikolp1234567890!@#$%^&*()_+'
            ticket = ''
            for i in range(28):
                ticket += random.choice(s)
            # 保存在服务端
            user.ticket = ticket
            user.save()
            # 保存在客户端
            response = HttpResponseRedirect(reverse('app:index'))
            response.set_cookie('ticket', ticket,max_age=129000)
            return response
        else:
            msg = '用户名或者密码错误'
            return render(request, 'login.html', {'msg': msg})


def logout(request):
    if request.method == 'GET':
        response = HttpResponseRedirect(reverse('user:login'))
        # 删除响应中的ticket
        response.delete_cookie('ticket')

        return response

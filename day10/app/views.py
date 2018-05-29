from django.contrib.auth.models import User
from django.core.paginator import Paginator
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse

from app.models import Grade, Student

'''
加载首页
'''


def index(request):
    if request.method == 'GET':
        return render(request, 'index.html')


"""
加载头部
"""


def head(request):
    if request.method == 'GET':
        return render(request, 'head.html')


"""
显示右边侧栏
"""


def left(request):
    if request.method == 'GET':
        return render(request, 'left.html')


"""
显示班级
"""


def grade(request):
    if request.method == 'GET':
        # 获取get请求传入的url参数如果获取不到参数就给赋一个默认值1.
        page_num = request.GET.get('page_num', 1)
        # 获取所有的数据
        all = list(Grade.objects.all())
        # 设置分页的参数
        paginator = Paginator(all, 3)
        # 获取数据的总数
        total = paginator.count
        # 获取page_num对应的数据
        pages = paginator.page(int(page_num))
        return render(request, 'grade.html', {'all': all, 'pages': pages, 'total': total})


"""
添加班级
"""


def addgrade(request):
    if request.method == 'GET':
        return render(request, 'addgrade.html')

    if request.method == 'POST':
        # 获取页面中的grade_name
        g_name = request.POST.get('grade_name')
        # 创建一个班级对象
        g = Grade()
        # 修改班级对象的g_name属性
        g.g_name = g_name
        # 保存修改后的值
        g.save()
        return HttpResponseRedirect(reverse('app:grade'))


"""
显示学生
"""


def students(request):
    if request.method == 'GET':
        # 同班级的处理
        page_num = request.GET.get('page_num', 1)
        students = Student.objects.all()
        paginator = Paginator(students, 5)
        total = paginator.count
        pages = paginator.page(int(page_num))
        return render(request, 'student.html', {'students': students, 'pages': pages, 'total': total})


"""
添加学生
"""


def addstu(request):
    if request.method == 'GET':
        grades = list(Grade.objects.all())
        return render(request, 'addstu.html', {'grades': grades})

    if request.method == 'POST':
        # 获取post请求传过来的参数
        s_name = request.POST.get('s_name')
        g_id = request.POST.get('g_id')
        s_img = request.FILES.get('s_img')

        # 获取班级信息
        # grade = Grade.objects.filter(id=g_id).first()
        # 创建学生信息
        # Student.objects.create(s_name=s_name,g=grade)
        # 方式二
        Student.objects.create(s_name=s_name, g_id=g_id, s_img=s_img)
        return redirect('app:student')


def delete(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        Student.objects.filter(pk=id).first().delete()
        return redirect('app:student')


# def delete(request,id):
#     if request.method == 'GET':
#         Student.objects.filter(pk=id).first().delete()
#         return redirect('app:student')

"""
修改页面
"""


# 方式一:
# def updategrade(request):
#     if request.method == 'GET':
#         set_name = Grade.objects.get(pk=request.GET.get('id'))
#         return render(request,'updategrade.html',{'set_name':set_name})
#     else:
#         set_name = Grade.objects.get(pk=request.POST['id'])
#         set_name.g_name = request.POST['grade_name']
#         set_name.save()
#         return redirect('app:grade')
# 方式二
def editorstudent(request):
    if request.method == 'GET':
        id = request.GET['id']
        return render(request, 'addgrade.html', {'id': id})

    if request.method == 'POST':
        id = request.POST.get('id')
        grade_name = request.POST.get('grade_name')
        g = Grade.objects.filter(pk=id).first()
        g.g_name = grade_name
        g.save()
        return HttpResponseRedirect(reverse('app:grade'))



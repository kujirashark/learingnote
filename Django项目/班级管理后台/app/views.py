from datetime import date

from django.contrib.auth.models import User
from django.core.paginator import Paginator
from django.db.models import F, Q
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from rest_framework.pagination import PageNumberPagination

from app.filters import StudentFilter
from app.models import Grade, Student, StuInfo, Student2, Grade2
from app.serializer import StudentSerizlizer, GradeSerizlizer
from utils.function import is_login

from rest_framework import mixins, viewsets

'''
加载首页
'''


# @is_login
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
        # # 获取get请求传入的url参数如果获取不到参数就给赋一个默认值1.
        # page_num = request.GET.get('page_num', 1)
        # # 获取所有的数据
        # all = list(Grade.objects.all())
        # # 设置分页的参数
        # paginator = Paginator(all, 3)
        # # 获取数据的总数
        # total = paginator.count
        # # 获取page_num对应的数据
        # pages = paginator.page(int(page_num))
        #return render(request, 'grade.html', {'all': all, 'pages': pages, 'total': total})
        return render(request, 'grade.html')

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


def selectstuden(request):
    # 查询语文成绩
    grade = Grade.objects.filter(g_name='python02').first()
    students = grade.student_set.all()

    stu = students.filter(s_yuwen__gt=F('s_shuxue') + 10)

    return HttpResponse('123')


# http://127.0.0.1:9999/app/selectstu/
#


#

def selectstu(request):
    # # 1. 通过某个学生拓展表去获取学生信息
    # s = StuInfo.objects.filter(pk=1).first().stu.stu_name
    # # 2. 通过学生表获取张三个人拓展表的信息
    # d = Student2.objects.filter(stu_name='张三').first().stuinfo.stu_addr
    # # 3.获取python班下的所有学生的信息和拓展表的信息
    # #grade1 =Grade2.objects.filter(g_name='python').first().student2_set.all()
    # g = Grade2.objects.filter(g_name='python').first()
    # stu5 = g.student2_set.all()
    # 4. 获取python班下语文成绩大于80分的女学生
    # c = Grade2.objects.filter(g_name='python').first().student2_set.all()
    # stu7 = c.filter(Q(stu_sex=0) & Q(stu_yuwen__gt=60))
    # 5. 获取python班下语文成绩超过数学成绩10分的男学生
    # grade3 = Grade2.objects.filter(g_name='python').first()
    # stu8 = grade3.student2_set.all()
    # 6. 获取出生在80后的男学生，查看他们的班级
    d = Student2.objects.filter(stu_birth__gt=date(1980, 1, 1)).first()

    return HttpResponse('123')


class api_student(mixins.ListModelMixin,
                  viewsets.GenericViewSet,
                  mixins.UpdateModelMixin,
                  mixins.RetrieveModelMixin,
                  mixins.DestroyModelMixin,
                  mixins.CreateModelMixin):

    #学生的所有信息
    queryset = Student.objects.all().filter(delete=False)
    #序列化学生的所有信息
    serializer_class = StudentSerizlizer
    #过滤
    filter_class = StudentFilter
    def get_queryset(self):

        # query = self.queryset
        # s_name = self.request.query_params.get('s_name')
        #
        # return query.filter(s_name__contains=s_name)
        return self.queryset.order_by('-id')



    def perform_destroy(self, instance):
        instance.delete = True
        instance.save()


class api_grade(mixins.ListModelMixin,
                viewsets.GenericViewSet,
                mixins.UpdateModelMixin,
                mixins.RetrieveModelMixin,
                mixins.DestroyModelMixin,
                mixins.CreateModelMixin):

    queryset = Grade.objects.all()

    serializer_class = GradeSerizlizer


def editorg(request):
    if request.method == 'GET':
        return render(request,'addgrade.html')


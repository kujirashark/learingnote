from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from rest_framework.routers import SimpleRouter
from app import views

router = SimpleRouter()

router.register(r'^api/student',views.api_student)
router.register(r'^api/grade',views.api_grade)


urlpatterns = [
    # 应用首页
    url(r'^index/', views.index, name='index'),
    url(r'^head/', views.head, name='head'),
    # 应用侧栏
    url(r'^left/', views.left, name='left'),
    # 显示班级列表
    url(r'^grade/', views.grade, name='grade'),
    # 添加班级
    url(r'^addgrade/', views.addgrade, name='addgrade'),
    # 添加学生
    url(r'^addstu/', views.addstu, name='addstu'),
    # 显示学生列表
    url(r'^student/', views.students, name='student'),
    # 删除学生
    url(r'^delete/', views.delete, name='delete'),
    # 更新班级信息方式一使用这个  前段页面要设置
    # url(r'^updategrade/',views.updategrade,name='updategrade'),
    url(r'^editorstudent/', views.editorstudent, name='editorstudent'),

    #F/Q的使用
    url(r'selectstuden/',views.selectstuden),
    url(r'selectstu/',views.selectstu),

    url(r'editorg/',views.editorg)
]
urlpatterns +=router.urls

#django自带的用户验证
# urlpatterns = [
#     # 应用首页
#     url(r'^index/', login_required(views.index), name='index'),
#     url(r'^head/', login_required(views.head), name='head'),
#     # 应用侧栏
#     url(r'^left/', login_required(views.left), name='left'),
#     # 显示班级列表
#     url(r'^grade/', login_required(views.grade), name='grade'),
#     # 添加班级
#     url(r'^addgrade/', login_required(views.addgrade), name='addgrade'),
#     # 添加学生
#     url(r'^addstu/', login_required(views.addstu), name='addstu'),
#     # 显示学生列表
#     url(r'^student/', login_required(views.students), name='student'),
#     # 删除学生
#     url(r'^delete/', login_required(views.delete), name='delete'),
#     # 更新班级信息方式一使用这个  前段页面要设置
#     # url(r'^updategrade/',views.updategrade,name='updategrade'),
#     url(r'^editorstudent/', login_required(views.editorstudent), name='editorstudent'),
#
#
# ]

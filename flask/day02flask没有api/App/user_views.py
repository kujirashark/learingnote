import random
from datetime import datetime
from flask import Blueprint, make_response, render_template, request, session, redirect, url_for

from App.models import db, Student, Grade, Course, User
from utils.ch_login import is_login

user_blueprint = Blueprint('user', __name__)


@user_blueprint.route('/setcookie/')
def set_cookie():
    temp = render_template('cookies.html')
    # 服务端创建响应
    res = make_response(temp)
    # 绑定cookie值 set_cookie(key ,value,max_age,expires)
    res.set_cookie('ticket', '123123123', max_age=10)

    return res


@user_blueprint.route('/delcookie/')
def dei_cookie():
    temp = render_template('cookies.html')
    # 服务端创建响应
    res = make_response(temp)
    # 删除cookie值 delete_cookie(key ,value,max_age,expires)
    res.delete_cookie('ticket')
    return res


@user_blueprint.route('/scores/', methods=['GET'])
def stu_scores():
    scores = [90, 80, 70, 27, 12]
    return render_template('scores.html', scores=scores)


@user_blueprint.route('/create_db/')
def create_db():
    # 创建数据库
    db.create_all()
    return '创建成功'


@user_blueprint.route('/drop_db/')
def drop_db():
    db.drop_all()
    return '删除成功'


@user_blueprint.route('/create_stu/', methods=['GET'])
def create_stu():
    stu = Student()
    stu.s_name = '李四'
    stu.s_age = '19'

    # 创建数据
    db.session.add(stu)
    db.session.commit()
    return '创建学生成功'


@user_blueprint.route('/select_stu/', methods=['GET'])
def select_stu():
    # 查询方式一
    # stus = Student.query.filter(Student.s_name == '张三')
    # 查询方式二
    # stus = Student.query.filter_by(s_name = '张三')
    # 查询所有的数据
    # stus = Student.query.all()
    # Student.query.filter()

    return '查询成功'


@user_blueprint.route('/stu_list/')
def stu_list():
    stus = Student.query.all()

    return render_template('students.html', stus=stus)


# @user_blueprint.route('/create_stu/',)
# def create_stu():


@user_blueprint.route('/create_stus/', methods=['GET', 'POST'])
def create_stus():
    stu_list = []
    for i in range(10):
        # 第一种
        # stu = Student()
        # stu.s_name = 'Bob%s' %random.randrange(100)
        # stu.s_age = '%s' % random.randrange(20)

        stu = Student('Bob%s' % random.randrange(100), '%s' % random.randrange(25))
        stu_list.append(stu)

    db.session.add_all(stu_list)
    db.session.commit()
    return '创建学生成功'


@user_blueprint.route('/update_stu/', methods=['GET', 'POST'])
def update_stu():
    if request.method == 'GET':
        id = request.args.get('id')
        stu = Student.query.filter_by(s_id=id).first()
        return render_template('stu_edit.html', stu=stu)

    if request.method == 'POST':
        id = request.form.get('id')
        username = request.form.get('username')
        age = request.form.get('age')

        stu = Student.query.filter_by(s_id=id).first()
        newstu = Student.query.filter_by(s_name=username).first()
        if newstu:
            msg = '修改的用户已经存在'
            stu = Student.query.filter_by(s_id=id).first()
            return render_template('stu_edit.html', msg=msg, stu=stu)
        stu.s_name = username
        stu.s_age = age

        db.session.commit()

        return redirect(url_for('user.stu_list'))


@user_blueprint.route('/stu_in/', methods=['GET'])
def stu_in_ids():
    # 查询学生id在4\5\6中的学生
    # stus = Student.query.filter(Student.s_id.in_([4,5,6]))
    # 查询学生年龄大于19的学生
    # stus = Student.query.filter(Student.s_age.__lt__(19))
    # 查询以姓名以n结尾的
    # stus = Student.query.filter(Student.s_name.endswith('n'))
    # 查询已L开头的
    # stus = Student.query.filter(Student.s_name.startswith('l'))
    # 模糊查询
    # stus = Student.query.filter(Student.s_name.contains('o'))
    # 查询id 等于5
    # stus = Student.query.filter(Student.s_id == 5).all()
    # 迷糊搜索
    # stus = Student.query.filter(Student.s_name.like('%c%'))
    # 获取前5个
    # stus = Student.query.limit(5)
    # stus = Student.query.order_by('s_id').offset(3).limit(5)

    # 跳过几个
    # stus = Student.query.order_by('s_id').offset(3)
    # 分页
    stus = Student.query.paginate(1, 5).items
    # paginate = stus.items
    return render_template('students.html', stus=stus)


@user_blueprint.route('/page/', methods=['GET', 'POST'])
def stu_page():
    if request.method == 'GET':
        page = int(request.args.get('page', 1))
        page_num = 3
        paginate = Student.query.order_by('s_id').paginate(page, page_num)
        stus = paginate.items

        return render_template('page.html', stus=stus, paginate=paginate)


@user_blueprint.route('/addgrade/')
def add_grade():
    grades = {
        'python': '人生苦短',
        'php': '好好学习',
        'java': '好辛苦',
        'go': '跑路了'
    }
    g_list = []
    for key in grades:
        g = Grade()
        g.g_name = key
        g.g_desc = grades[key]
        g_list.append(g)

    db.session.add_all(g_list)
    db.session.commit()

    return '成功'


@user_blueprint.route('/grade_all/')
@is_login
def grade_all():
    """
    显示所有的班级信息
    """
    grades = Grade.query.all()
    return render_template('grades.html', grades=grades)


@user_blueprint.route('/create_stu_by_grade/', methods=['GET', 'POST'])
def create_stu_by_grade():
    """
    班级中添加学生
    """
    if request.method == 'GET':
        g_id = request.args.get('g_id')
        return render_template('create_student.html', g_id=g_id)

    if request.method == 'POST':
        g_id = request.form.get('g_id')
        s_name = request.form.get('stuname')
        # 创建学生对象
        stu = Student()
        stu.s_name = s_name
        stu.grades = g_id

        db.session.add(stu)
        db.session.commit()

        return redirect(url_for('user.stu_list'))


@user_blueprint.route('/select_stu_by_grade/', methods=['GET', 'POST'])
def select_stu_by_grade():
    """
    根据学生查询班级
    """
    if request.method == 'GET':
        # 获取班级的id
        g_id = request.args.get('g_id')
        # 根据班级id查询班级
        g = Grade.query.get(g_id)
        # 根据班级去查询学对应的学生
        stus = g.students
        return render_template('students.html', stus=stus)


@user_blueprint.route('/course/', methods=['GET', 'POST'])
def course():
    courses = ['数学', '计算机网络基础', '语文', 'Java', 'Python', 'Linux', '物理', '人工智能']
    courses_list = []
    for course in courses:
        c = Course()
        c.c_name = course
        courses_list.append(c)

    db.session.add_all(courses_list)
    db.session.commit()
    return '添加课程成功'


@user_blueprint.route('/add_course/', methods=['GET', 'POST'])
def add_course():
    if request.method == 'GET':
        courses = Course.query.all()
        return render_template('course.html', courses=courses)
    if request.method == 'POST':
        s_id = request.args.get('s_id')

        course_id = request.form.get('course_id')
        # 通过course_id获取课程信息
        course = Course.query.get(course_id)
        # 通过s_id获取学生信息
        stu = Student.query.get(s_id)
        # 课程和学生建立关联关系
        course.students.append(stu)
        db.session.add(course)
        db.session.commit()

        return redirect(url_for('user.grade_all'))


@user_blueprint.route('/show_course/<int:id>', methods=['GET'])
def show_course(id):
    if request.method == 'GET':
        stu = Student.query.get(id)
        s_id = id
        courses = stu.course
        return render_template('show_course.html', courses=courses, s_id=s_id)


@user_blueprint.route('/stu/<int:s_id>/del_course/<int:c_id>', methods=['GET'])
def del_course(s_id, c_id):
    if request.method == 'GET':
        stu = Student.query.get(s_id)
        course = Course.query.get(c_id)
        # 删除学生和课程的关联关系
        course.students.remove(stu)
        db.session.commit()
        return redirect(url_for('user.grade_all'))


@user_blueprint.route('/register/', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template('register.html')
    if request.method == 'POST':
        username = request.form.get('username')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')

        flag = True
        if not all([username, password1, password2]):
            msg, flag = '请填写完成信息', False
        if len(username) > 16:
            msg, flag = '用户名太长,重新输入', False
        if password2 != password1:
            msg, flag = '二次密码不一致', False
        if not flag:
            return render_template('register.html', msg=msg)

        user = User(username, password1)
        user.save()

        return redirect(url_for('user.login'))


@user_blueprint.route('/login/', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        if not all([username, password]):
            msg = '请填写完整登录信息'
            return render_template('login.html', msg=msg)

        user = User.query.filter_by(username=username, password=password).first()

        if user:
            session['user_id'] = user.id
            return redirect(url_for('user.grade_all'))
        else:
            msg = '用户名或者密码错误'
            return render_template('login.html', msg=msg)

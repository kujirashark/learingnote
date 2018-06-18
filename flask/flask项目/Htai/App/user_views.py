from flask import Blueprint, redirect, render_template, request, url_for, session

from App.models import db, User, Grade, Student, Role, Permission
from utils.ch_login import is_login

user_blueprint = Blueprint('user', __name__)


@user_blueprint.route('/create_db/')
def create_db():
    """
    创建数据
    """
    db.create_all()
    return '创建成功'


@user_blueprint.route('/drop_db/')
def drop_db():
    """
    删除数据库
    """
    db.drop_all()
    return '删除成功'


@user_blueprint.route('/home/', methods=['GET'])
@is_login
def home():
    """
    首页
    """
    if request.method == 'GET':
        return render_template('index.html')


@user_blueprint.route('/head/', methods=['GET'])
@is_login
def head():
    """
    页头
    """
    if request.method == 'GET':
        user = session.get('username')
        return render_template('head.html', user=user)


@user_blueprint.route('/left/', methods=['GET'])
def left():
    """左侧栏"""
    if request.method == 'GET':
        # 获取登录的用户信息
        user = session.get('username')
        # 获取用户的权限
        permissions = User.query.filter_by(username=user).first().role.permission
        return render_template('left.html', permissions=permissions)


@user_blueprint.route('/register/', methods=['GET', 'POST'])
def register():
    """
    用户注册页面
    """
    if request.method == 'GET':
        return render_template('register.html')

    if request.method == 'POST':
        # 获取用户填写的信息
        username = request.form.get('username')
        pwd1 = request.form.get('pwd1')
        pwd2 = request.form.get('pwd2')

        # 定义个变量来控制过滤用户填写的信息
        flag = True
        # 判断用户是否信息都填写了.(all()函数可以判断用户填写的字段是否有空)
        if not all([username, pwd1, pwd2]):
            msg, flag = '* 请填写完整信息', False
        # 判断用户名是长度是否大于16
        if len(username) > 16:
            msg, flag = '* 用户名太长', False
        # 判断两次填写的密码是否一致
        if pwd1 != pwd2:
            msg, flag = '* 两次密码不一致', False
        # 如果上面的检查有任意一项没有通过就返回注册页面,并提示响应的信息
        if not flag:
            return render_template('register.html', msg=msg)
        # 核对输入的用户是否已经被注册了
        u = User.query.filter(User.username == username).first()
        # 判断用户名是否已经存在
        if u:
            msg = '用户名已经存在'
            return render_template('register.html', msg=msg)
        # 上面的验证全部通过后就开始创建新用户
        user = User(username=username, password=pwd1)
        # 保存注册的用户
        user.save()
        # 跳转到登录页面
        return redirect(url_for('user.login'))


@user_blueprint.route('/login/', methods=['GET', 'POST'])
def login():
    """
    登录
    """
    if request.method == 'GET':
        return render_template('login.html')

    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        # 判断用户名和密码是否填写
        if not all([username, password]):
            msg = '* 请填写好完整的信息'
            return render_template('login.html', msg=msg)
        # 核对用户名和密码是否一致
        user = User.query.filter_by(username=username, password=password).first()
        # 如果用户名和密码一致
        if user:
            # 向session中写入相应的数据
            session['user_id'] = user.u_id
            session['username'] = user.username
            return render_template('index.html')
        # 如果用户名和密码不一致返回登录页面,并给提示信息
        else:
            msg = '* 用户名或者密码不一致'
            return render_template('login.html', msg=msg)


@user_blueprint.route('/logout/', methods=['GET'])
def logout():
    """
    退出登录
    """
    if request.method == 'GET':
        # 清空session
        session.clear()
        # 跳转到登录页面
        return redirect(url_for('user.login'))


@user_blueprint.route('/grade/', methods=['GET', 'POST'])
@is_login
def grade_list():
    """
    显示班级列表
    """
    if request.method == 'GET':
        # 查询第几页的数据
        page = int(request.args.get('page',1))
        # 每页的条数是多少,默认为5条
        page_num = int(request.args.get('page_num',5))
        # 查询当前第几个的多少条数据
        paginate = Grade.query.order_by('g_id').paginate(page,page_num)
        # 获取某也的具体数据
        grades = paginate.items
        # 返回获取到的班级信息给前端页面
        return render_template('grade.html', grades=grades,paginate=paginate)


@user_blueprint.route('/addgrade/', methods=['GET', 'POST'])
@is_login
def add_grade():
    """添加班级"""
    if request.method == 'GET':
        return render_template('addgrade.html')

    if request.method == 'POST':
        g_name = request.form.get('g_name')
        g = Grade.query.filter(Grade.g_name == g_name).first()
        # 判断要添加的信息数据库中是否存在(因为班级名称不能重复)
        if g:
            msg = '*班级名称不能重复,请核对好在来添加'
            return render_template('addgrade.html', msg=msg)
        # 创建班级
        grade = Grade(g_name)
        # 保存班级信息
        grade.save()

        return redirect(url_for('user.grade_list'))


@user_blueprint.route('/edit_grade/', methods=['GET', 'POST'])
@is_login
def edit_grade():
    """编辑班级"""
    if request.method == 'GET':
        g_id = request.args.get('g_id')
        g_name = Grade.query.filter(Grade.g_id == g_id).first().g_name
        return render_template('addgrade.html', g_name=g_name, g_id=g_id)

    if request.method == 'POST':
        # 获取需要修改的班级id
        g_id = request.form.get('g_id')
        g_name = request.form.get('g_name')
        # 通过获取到的班级id
        grade = Grade.query.filter(Grade.g_id == g_id).first()
        # 重新给班级赋值
        grade.g_name = g_name
        grade.save()

        return redirect(url_for('user.grade_list'))


@user_blueprint.route('/grade_student/', methods=['GET'])
@is_login
def grade_students_list():
    """班级中学习的信息列表"""
    if request.method == 'GET':
        g_id = request.args.get('g_id')
        stus = Student.query.filter(Student.grade_id == g_id).all()
        return render_template('student.html', stus=stus)


@user_blueprint.route('/student/', methods=['GET', 'POST'])
@is_login
def student_list():
    """学生信息列表"""
    if request.method == 'GET':
        page = int(request.args.get('page',1))
        page_num = int(request.args.get('page_num',5))
        paginate = Student.query.order_by('s_id').paginate(page,page_num)
        stus = paginate.items
        return render_template('student.html', stus=stus,paginate=paginate)


@user_blueprint.route('/addstu/', methods=['GET', 'POST'])
@is_login
def add_stu():
    """添加学生"""
    if request.method == 'GET':
        grades = Grade.query.all()
        return render_template('addstu.html', grades=grades)

    if request.method == 'POST':
        s_name = request.form.get('s_name')
        s_sex = request.form.get('s_sex')
        grade_id = request.form.get('g_name')

        stu = Student.query.filter(Student.s_name == s_name).first()
        if stu:
            msg = '* 学习姓名不能重复'
            grades = Grade.query.all()
            return render_template('addstu.html', grades=grades, msg=msg)
        stu = Student(s_name=s_name, s_sex=s_sex, grade_id=grade_id)
        stu.save()

        return redirect(url_for('user.student_list'))


@user_blueprint.route('/roles/', methods=['GET', 'POST'])
@is_login
def roles_list():
    """角色信息列表"""
    if request.method == 'GET':
        roles = Role.query.all()
        return render_template('roles.html', roles=roles)


@user_blueprint.route('/addroles/', methods=['GET', 'POST'])
@is_login
def add_roles():
    """添加角色"""
    if request.method == 'GET':
        return render_template('addroles.html')
    if request.method == 'POST':

        r_name = request.form.get('r_name')
        role = Role(r_name=r_name)
        role.save()

        return redirect(url_for('user.roles_list'))


@user_blueprint.route('/userperlist/', methods=['GET', 'POST'])
@is_login
def user_per_list():
    """用户权限列表"""
    if request.method == 'GET':
        r_id = request.args.get('r_id')
        pers = Role.query.filter(Role.r_id == r_id).first().permission
        return render_template('user_per_list.html', pers=pers)

    if request.method == 'POST':
        r_id = request.args.get('r_id')
        p_id = request.form.get('p_id')
        # 获取到角色对象
        role = Role.query.get(r_id)
        # 获取到权限对象
        per = Permission.query.get(p_id)
        # 解除角色和权限的对应关系
        per.roles.remove(role)
        # 保存解除的关联的信息
        db.session.commit()
        pers = Role.query.filter(Role.r_id == r_id).first().permission
        # 返回到用户权限列表
        return render_template('user_per_list.html', pers=pers, r_id=r_id)


@user_blueprint.route('/adduserper/', methods=['GET', 'POST'])
@is_login
def add_user_per():
    """添加用户权限"""
    if request.method == 'GET':
        permissions = Permission.query.all()
        r_id = request.args.get('r_id')
        return render_template('add_user_per.html', permissions=permissions, r_id=r_id)

    if request.method == 'POST':
        r_id = request.form.get('r_id')
        p_id = request.form.get('p_id')
        # 获取角色对象
        role = Role.query.get(r_id)
        # 获取权限对象
        per = Permission.query.get(p_id)
        # 添加对应的角色和权限的对应关系
        per.roles.append(role)
        # 添加
        db.session.add(per)
        # 保存信息
        db.session.commit()

        return redirect(url_for('user.roles_list'))


@user_blueprint.route('/subuserper/', methods=['GET', 'POST'])
@is_login
def sub_user_per():
    """减少用户权限"""
    if request.method == 'GET':
        r_id = request.args.get('r_id')
        pers = Role.query.filter(Role.r_id == r_id).first().permission
        return render_template('user_per_list.html', pers=pers, r_id=r_id)

    if request.method == 'POST':
        r_id = request.args.get('r_id')
        p_id = request.form.get('p_id')
        role = Role.query.get(r_id)
        per = Permission.query.get(p_id)

        # 解除角色和权限的对应关系
        per.roles.remove(role)
        db.session.commit()

        pers = Role.query.filter(Role.r_id == r_id).first().permission
        return render_template('user_per_list.html', pers=pers, r_id=r_id)


@user_blueprint.route('/permissions/', methods=['GET', 'POST'])
@is_login
def permission_list():
    """权限列表"""
    if request.method == 'GET':
        permissions = Permission.query.all()
        return render_template('permissions.html', permissions=permissions)


@user_blueprint.route('/addpermission/', methods=['GET', 'POST'])
@is_login
def add_permission():
    """添加权限"""
    if request.method == 'GET':
        pers = Permission.query.all()
        return render_template('addpermission.html', pers=pers)

    if request.method == 'POST':
        p_name = request.form.get('p_name')
        p_er = request.form.get('p_er')

        p_name_test_repeat = Permission.query.filter(Permission.p_name == p_name).first()
        if p_name_test_repeat:
            msg = '*权限名称重复'
            return render_template('addpermission.html', msg=msg)

        p_er_test_repeat = Permission.query.filter(Permission.p_er == p_er).first()

        if p_er_test_repeat:
            msg1 = '*权限简写名重复'
            return render_template('addpermission.html', msg1=msg1)

        permission = Permission(p_name=p_name, p_er=p_er)
        permission.save()

        return redirect(url_for('user.permission_list'))


@user_blueprint.route('/eidtorpermission/', methods=['GET', 'POST'])
@is_login
def eidtor_permission():
    """编辑权限"""
    if request.method == 'GET':
        p_id = request.args.get('p_id')
        pers = Permission.query.filter(Permission.p_id == p_id).first()
        return render_template('addpermission.html', pers=pers, p_id=p_id)
    if request.method == 'POST':
        p_id = request.form.get('p_id')
        p_name = request.form.get('p_name')
        p_er = request.form.get('p_er')

        p_name_test_repeat = Permission.query.filter(Permission.p_name == p_name).first()
        if p_name_test_repeat:
            msg = '*权限名称重复'
            pers = Permission.query.all()
            return render_template('addpermission.html', msg=msg, pers=pers)

        p_er_test_repeat = Permission.query.filter(Permission.p_er == p_er).first()

        if p_er_test_repeat:
            msg1 = '*权限简写名重复'
            pers = Permission.query.all()
            return render_template('addpermission.html', msg1=msg1, pers=pers)

        per = Permission.query.filter(Permission.p_id == p_id).first()
        per.p_name = p_name
        per.p_er = p_er
        db.session.commit()

        return redirect(url_for('user.permission_list'))


@user_blueprint.route('/userlist/', methods=['GET', 'POST'])
@is_login
def user_list():
    """用户信息列表"""
    if request.method == 'GET':
        page = int(request.args.get('page',1))
        page_num = int(request.args.get('page_num',5))
        paginate = User.query.order_by('u_id').paginate(page,page_num)
        users = paginate.items
        return render_template('users.html', users=users,paginate=paginate)


@user_blueprint.route('/adduser/', methods=['GET', 'POST'])
@is_login
def add_user():
    """添加用户信息"""
    if request.method == 'GET':
        return render_template('adduser.html')

    if request.method == 'POST':
        username = request.form.get('username')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')

        flag = True
        if not all([username, password1, password2]):
            msg, flag = '请填写完整信息', False
        if len(username) > 16:
            msg, flag = '用户名太长', False
        if password1 != password2:
            msg, flag = '两次密码不一致', False
        if not flag:
            return render_template('adduser.html', msg=msg)
        user = User(username=username, password=password1)
        user.save()
        return redirect(url_for('user.user_list'))


@user_blueprint.route('/assignrole/', methods=['GET', 'POST'])
@is_login
def assign_user_role():
    """分配用户权限"""
    if request.method == 'GET':
        u_id = request.args.get('u_id')
        roles = Role.query.all()
        return render_template('assign_user_role.html', roles=roles, u_id=u_id)
    if request.method == 'POST':
        r_id = request.form.get('r_id')
        u_id = request.form.get('u_id')
        user = User.query.filter_by(u_id=u_id).first()
        user.role_id = r_id
        db.session.commit()

        return redirect(url_for('user.user_list'))


@user_blueprint.route('/changepwd/', methods=['GET', 'POST'])
@is_login
def change_password():
    """修改用户密码"""
    if request.method == 'GET':
        username = session.get('username')
        user = User.query.filter_by(username=username).first()
        return render_template('changepwd.html', user=user)

    if request.method == 'POST':
        username = session.get('username')
        pwd1 = request.form.get('pwd1')
        pwd2 = request.form.get('pwd2')
        pwd3 = request.form.get('pwd3')

        pwd = User.query.filter(User.password == pwd1, User.username == username).first()
        if not pwd:
            msg = '请输入正确的旧密码'
            username = session.get('username')
            user = User.query.filter_by(username=username).first()
            return render_template('changepwd.html', msg=msg, user=user)
        else:
            if not all([pwd2, pwd3]):
                msg = '密码不能为空'
                username = session.get('username')
                user = User.query.filter_by(username=username).first()
                return render_template('changepwd.html', msg=msg, user=user)
            if pwd2 != pwd3:
                msg = '两次密码不一致,请重新输入'
                username = session.get('username')
                user = User.query.filter_by(username=username).first()
                return render_template('changepwd.html', msg=msg, user=user)
            pwd.password = pwd2
            db.session.commit()
            return redirect(url_for('user.change_pass_sucess'))


@user_blueprint.route('/changepwdsu/', methods=['GET'])
@is_login
def change_pass_sucess():
    """修改密码成功后"""
    if request.method == 'GET':
        return render_template('changepwdsu.html')

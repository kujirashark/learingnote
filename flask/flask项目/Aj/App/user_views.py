import os
import re

from flask import Blueprint, request, render_template, jsonify, session, redirect, url_for

from App.models import User, db
from utils import status_code
from utils.settings import UPLOAD_DIR
from utils.user_is_login import is_login

user_blueprint = Blueprint('user', __name__)


@user_blueprint.route('/create_db/')
@is_login
def create_database():
    db.create_all()
    return '创建成功'


@user_blueprint.route('/register/', methods=['GET'])
def register():
    """用户注册"""
    return render_template('register.html')


@user_blueprint.route('/register/', methods=['POST'])
def register_post():
    mobile = request.form.get('mobile')
    password = request.form.get('password')
    password2 = request.form.get('password2')
    # 1.验证数据的完整性
    if not all([mobile, password, password2]):
        return jsonify(status_code.USER_REGISTER_DATA_NOT_NULL)
    # 2.验证手机号码的正确性
    if not re.match(r'^1[34578][0-9]{9}$', mobile):
        return jsonify(status_code.USER_REGISTER_MOBILE_ERROR)

    # 3.验证密码
    if password != password2:
        return jsonify(status_code.USER_REGISTER_PASSWORD_IS_NOT_VALID)

    user = User.query.filter(User.phone == mobile).first()
    if user:
        return jsonify(status_code.USER_REGISTER_MOBILE_EXSTIS)
    else:
        user = User()
        user.phone = mobile
        user.name = mobile
        user.password = password
        user.add_update()
        return jsonify(status_code.SUCCESS)


@user_blueprint.route('/login/', methods=['GET'])
def login():
    return render_template('login.html')


@user_blueprint.route('/login/', methods=['POST'])
def user_login():
    """用户登录"""
    mobile = request.form.get('mobile')
    password = request.form.get('password')

    # 1.验证数据完整性
    if not all([mobile, password]):
        return jsonify(status_code.USER_REGISTER_DATA_NOT_NULL)
    # 2.验证手机正确性
    if not re.match(r'^1[34578][0-9]{9}$', mobile):
        return jsonify(status_code.USER_REGISTER_MOBILE_ERROR)
    # 3. 验证用户是否存在

    user = User.query.filter(User.phone == mobile).first()
    if user:
        if not user.check_pwd(password):
            return jsonify(status_code.USER_LOGIN_PASSWORD_IS_NOT_VALID)
        # 4.验证用户成功
        session['user_id'] = user.id
        return jsonify(status_code.SUCCESS)
    else:
        return jsonify(status_code.USER_LOGIN_USER_NOT_EXSITS)


@user_blueprint.route('/logout/', methods=['GET'])
def logout():
    session.clear()
    return jsonify(code=status_code.ok)


@user_blueprint.route('/my/', methods=['GET'])
@is_login
def my():
    return render_template('my.html')


@user_blueprint.route('/profile/', methods=['GET'])
@is_login
def profile():
    user_name = User.query.get(session.get('user_id')).name
    return render_template('profile.html', user_name=user_name)


@user_blueprint.route('/profile/', methods=['PATCH'])
@is_login
def user_profile():
    # 获取文件
    file = request.files.get('avatar')
    # 判断文件是否是图片
    if not re.match(r'image/.*', file.mimetype):
        return jsonify(status_code.USER_CHANGE_PROFILE_IMAGES)
    # 定义文件的路径
    image_path = os.path.join(UPLOAD_DIR, file.filename)
    # 保存文件
    file.save(image_path)
    # 获取登录用户的信息
    user = User.query.get(session['user_id'])
    # 获取用户的头像地址
    avatar_path = os.path.join('upload', file.filename)
    # 更新头像信息
    user.avatar = avatar_path
    try:
        user.add_update()
    except Exception as e:
        # 如果服务器取不到数据就报数据库错误额异常
        return jsonify(status_code.DATABASE_ERROR)
    return jsonify(code=status_code.ok, image_url=avatar_path)


@user_blueprint.route('/profile/name/', methods=['PATCH'])
@is_login
def user_profile_name():
    # 获取修改的用户名
    name = request.form.get('name')
    users = User.query.filter_by(name=name).all()
    if users:
        # 过滤用户名是否存在
        return jsonify(status_code.USER_CHANGE_PORFILE_NAME_IS_INVALID)
    else:
        user = User.query.get(session.get('user_id'))
        user.name = name
        try:
            user.add_update()
        except:
            # 如果出现异常回滚
            db.session.rollback()
            return jsonify(status_code.DATABASE_ERROR)
        return jsonify(code=status_code.ok, name=name)


@user_blueprint.route('/userinfo/')
@is_login
def user_info():
    user = User.query.get(session.get('user_id'))
    return jsonify(code=status_code.ok, data=user.to_basic_dict())


@user_blueprint.route('/profile_img/', methods=['GET'])
@is_login
def user_profile_info():
    user = User.query.get(session.get('user_id'))
    return jsonify(code=status_code.ok, data=user.to_basic_dict())


@user_blueprint.route('/auth/', methods=['GET'])
@is_login
def auth():
    return render_template('auth.html')


@user_blueprint.route('/auth/', methods=['PATCH'])
@is_login
def user_auth():
    real_name = request.form.get('real_name')
    id_card = request.form.get('id_card')

    # 判断实名信息是否为空
    if not all([real_name, id_card]):
        return jsonify(status_code.USER_AUTH_DATA_IS_NOT_NULL)
    # 匹配身份证号码
    if not re.match(r'^[1-9]\d{17}$', id_card):
        return jsonify(status_code.USER_AUTH_ID_CARD_IS_NOT_VALID)

    # 获取用户信息并且向数据库中添加值
    user = User.query.get(session['user_id'])
    user.id_name = real_name
    user.id_card = id_card
    try:
        user.add_update()
    except:
        db.session.rollback()
        return jsonify(status_code.DATABASE_ERROR)
    return jsonify(code=status_code.ok)


@user_blueprint.route('/authinfo/', methods=['GET'])
def auth_info():
    user = User.query.get(session['user_id'])
    return jsonify(code=status_code.ok, data=user.to_auth_dict())




import os

from flask import Flask, redirect, url_for, session
from flask_session import Session
import redis

from App.hello_views import hello_blueprint
from App.user_views import user_blueprint
from App.models import db


def create_app():
    BASE_DIR = os.path.dirname(os.path.dirname(__file__))
    static_dir = os.path.join(BASE_DIR, 'static')
    templates_dir = os.path.join(BASE_DIR, 'templates')

    app = Flask(__name__,
                static_folder=static_dir,
                template_folder=templates_dir)
    # 注册蓝图
    app.register_blueprint(blueprint=hello_blueprint, url_prefix='/hello')
    app.register_blueprint(blueprint=user_blueprint, url_prefix='/user')

    # 配置数据库

    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:123456@127.0.0.1:3306/helloflask'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    # 设置session密钥
    app.config['SECRET_KEY'] = 'secret_key'
    # 设置连接的redis数据库 默认连接到本地6379
    app.config['SESSION_TYPE'] = 'redis'
    # 设置远程
    app.config['SESSION_REDIS'] = redis.Redis(host='127.0.0.1', port=6379)
    # 初始化session
    # 第一种
    # se = Session()
    # se.init_app(app=app)
    # 第二种
    Session(app=app)
    # 初始化模型
    # 第一种方法
    db.init_app(app=app)

    return app




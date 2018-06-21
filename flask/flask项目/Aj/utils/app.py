import redis
from flask import Flask
from flask_session import Session

from App.user_views import user_blueprint
from App.models import db
from App.house_views import house_blueprint
from App.order_views import order_blueprint

from utils.settings import static_dir, templates_dir

se = Session()


def create_app():
    app = Flask(__name__, static_folder=static_dir, template_folder=templates_dir)

    app.register_blueprint(blueprint=user_blueprint, url_prefix='/user')
    app.register_blueprint(blueprint=house_blueprint, url_prefix='/house')
    app.register_blueprint(blueprint=order_blueprint, url_prefix='/order')

    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:123456@127.0.0.1:3306/Aj'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    app.config['SECRET_KEY'] = 'secret_key'
    app.config['SESSION_TYPE'] = 'redis'
    app.config['SESSION_REDIS'] = redis.Redis(host='127.0.0.1', port=6379)

    db.init_app(app=app)
    se.init_app(app=app)
    return app

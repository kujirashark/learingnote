from flask import Blueprint

hello_blueprint = Blueprint('hello', __name__)


@hello_blueprint.route('/')
def hello():
    return 'hello'

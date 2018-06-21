from flask import session, redirect, url_for

from functools import wraps


def is_login(func):
    """
    装饰器用于登录验证
    session['user_id']
    """
    @wraps(func)
    def check_login(*args, **kwargs):
        # 验证登录
        # 获取是否有user_id
        user_session = session.get('user_id')
        # 如果有
        if user_session:
            return func(*args, **kwargs)
        # 如果验证失败
        else:
            return redirect(url_for('user.login'))
    return check_login

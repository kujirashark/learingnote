from flask import url_for,redirect,session


def is_login(func):
    def check_login():
        user_session = session.get('user_id')
        if user_session:
            return func
        else:
            return redirect(url_for('user.login'))

    return check_login
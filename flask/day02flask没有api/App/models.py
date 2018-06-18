from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

# 创建数据库对象
db = SQLAlchemy()


class Student(db.Model):
    s_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    s_name = db.Column(db.String(16), unique=True)
    s_age = db.Column(db.Integer, default=18)
    grades = db.Column(db.Integer,db.ForeignKey('grade.g_id'),nullable=True)
    # 创建表名称
    __tablename__ = 'student'

    # def __init__(self, name, age):
    #     self.s_name = name
    #     self.s_age = age


class Grade(db.Model):
    g_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    g_name = db.Column(db.String(16), unique=True, nullable=False)
    g_desc = db.Column(db.String(30), nullable=True)
    g_create_time = db.Column(db.Date, default=datetime.now())
    students = db.relationship('Student',backref='grade',lazy=True)

    __tablename__ = 'grade'

    # def __init__(self,name,des,ctime):
    #     self.g_name = name
    #     self.g_desc = des
    #     self.g_create_time = ctime

sc = db.Table('sc',
              db.Column('s_id',db.Integer,db.ForeignKey('student.s_id'),primary_key=True),
              db.Column('c_id',db.Integer,db.ForeignKey('course.c_id'),primary_key=True)
              )


class Course(db.Model):

    c_id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    c_name = db.Column(db.String(16),unique=True)
    c_create_time = db.Column(db.DateTime,default=datetime.now)
    students = db.relationship('Student',
                               secondary=sc,
                               backref='course')

    __tablename__ = 'course'


class User(db.Model):

    id = db.Column(db.Integer,autoincrement=True,primary_key=True)
    username = db.Column(db.String(16),unique=True)
    password = db.Column(db.String(200))
    create_time = db.Column(db.DateTime,default=datetime.now)

    __tablename__ = 'user'

    def __init__(self ,username,pwd):
        self.username = username
        self.password = pwd

    def save(self):
        db.session.add(self)
        db.session.commit()





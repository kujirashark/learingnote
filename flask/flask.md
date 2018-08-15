虚拟环境

pip install flask

修改端口

```
if __name__ == '__main__':
    app.run(port=8080,host='127.0.0.1,debug=Fasle)
```

第一个插件

pip install flask-script

```
from flask_script import Manager

python app.py runserver -p 8000 -h 0.0.0.0

if __name__ == '__main__':
    manage.run()
```







宏定义


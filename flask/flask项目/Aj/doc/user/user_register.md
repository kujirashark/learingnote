### 用户注册

#### request请求
    GET /user/register/
#### Params
    mobile      str     电话号码
    password    str     密码
    password2   str     确认密码

#### 响应

####1. 填写信息为空:
        {
        'code': '1001',
        'msg': '请填写完整信息'
    }

####2. 手机号码不正确:
    {
    'code': '1002',
    'msg': '手机号码不正确'
    }

####3. 验证密码
    {
    'code': '1003',
    'msg': '密码不正确'
    }

####4. 验证用户是否存在
    {
    'code': '1004',
    'msg': '用户已注册请直接登录'
    }

####5. 请求成功:
    {
    'code': 200,
    'msg': '请求成功'
    }
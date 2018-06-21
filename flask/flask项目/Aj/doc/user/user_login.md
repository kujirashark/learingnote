###用户登录

####请求
```javascript
GET     /user/login/
POST    /user/login/
```

####Params

```javascript
POST
mobile      str   用户电话
password    str   用户密码
```

####响应

#####1. 验证数据的完整性
```javascript
 {
    'code': '1001',
    'msg': '请填写完整信息'
 }
```

#####2. 验证手机号码的正确性
```javascript
{
    'code': '1002',
    'msg': '手机号码不正确'
}
```

#####3. 验证密码是否正确
```javascript
{
    'code': '1006',
    'msg': '密码不正确'
}
```

#####4. 验证是否有这个用户
```javascript
{
    'code': '1005',
    'msg': '该用户没有注册'
}
```

#####5. 请求成功
```javascript
{
    'code': 200,
    'msg': '请求成功'
}
```
ok = 200
SUCCESS = {'code':200,'msg':'请求成功'}
# 用户模块
USER_REGISTER_DATA_NOT_NULL = { 'code': '1001', 'msg' : '请填写完整信息'}
USER_REGISTER_MOBILE_ERROR = {'code':'1002','msg':'手机号码不正确'}
USER_REGISTER_PASSWORD_IS_NOT_VALID = {'code':'1003','msg':'密码不正确'}
USER_REGISTER_MOBILE_EXSTIS = {'code':'1004','msg':'用户已注册请直接登录'}


USER_LOGIN_USER_NOT_EXSITS = {'code':'1005','msg':'该用户没有注册'}
USER_LOGIN_PASSWORD_IS_NOT_VALID = {'code':'1006','msg':'密码不正确'}


# my
USER_CHANGE_PROFILE_IMAGES = {'code': '1007','msg':'上传的不是图片'}

DATABASE_ERROR ={'code':'1008','msg':'数据库错误,请稍后再试' }

USER_CHANGE_PORFILE_NAME_IS_INVALID = {'code':'1009','msg':'用户名已重复请重新输入'}

#id
USER_AUTH_DATA_IS_NOT_NULL = {'code':'1020','msg':'实名认证信息请填写完整'}
USER_AUTH_ID_CARD_IS_NOT_VALID = {'code':'1021','msg':'身份证号码不匹配'}


# order
ORDER_BEGIN_END_DATA_NOT_NULL ={'code':'1300','msg':'预约时间不能为空'}
ORDER_BEGIN_DATA_GT_END_DATA_ERROE = {'code':'1301','msg':'预约开始时间大于结束时间'}
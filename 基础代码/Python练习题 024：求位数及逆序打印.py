'''
 给一个正整数，要求：一、求它是几位数，二、逆序打印出各位数字。
'''


# 不用递归，实在太简单了！！！代码上：
# str = input('请输入一个正整数：')
# print('这个数字是%s位数，逆序为%s。' % (len(str), str[::-1]))

str = input('请输入一个正整数：')
def f(x):
    if x == 0:
        return str[0]
    else:
        return str[x] + f(x-1)
print('%s位数，逆序为：%s' % (len(str), f(len(str)-1)))
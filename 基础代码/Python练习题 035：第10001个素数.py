'''
代码的思路其实挺简单：首先自定义一个函数，用来判断某个数字是否为素数。
之后从数字1开始判断，只要是素数，就放进 lst 列表，直到 len(lst) = 10001 为止，此时 lst[-1] 即为所求之数字。
'''


'''
此方法太耗时
'''
# import time
#
# def f(x):  # 判断 x 是否为素数，返回bool值
#     if x == 2:
#         return True
#     elif x <= 1:
#         return False
#     else:
#         t = False  # 判断是否能够整除
#         for i in range(2, x // 2):
#             if x % i == 0:
#                 t = True
#                 break
#         if t:  # 若能整除
#             return False
#         else:
#             return True
#
# startTime = time.clock()  # 计时开始
# lst = []  # 存放素数的列表
# a = 1  # 从数字 1 开始判断
# while len(lst) < 10001:
#     if f(a):
#         lst.append(a)
#     a += 1
# endTime = time.clock()  # 计时结束
#
# print('第10001个素数为%s' % lst[-1])
# print('耗时%.2f秒' % (endTime - startTime))  # 计算耗时



import time

def f(x):  # 判断 x 是否为素数，返回bool值
    if x == 2:
        return True
    elif x <= 1:
        return False
    else:
        t = False  # 判断是否能够整除
        for i in range(2, int(x ** .5) + 1):
            if x % i == 0:
                t = True
                break
        if t:  # 若能整除
            return False
        else:
            return True

startTime = time.clock()  # 计时开始
lst = []  # 存放素数的列表
a = 1  # 从数字 1 开始判断
while len(lst) < 10001:
    if f(a):
        lst.append(a)
    a += 1
print('第10001个素数为%s' % lst[-1])
endTime = time.clock()  # 计时结束
print('耗时%.2f秒' % (endTime - startTime))  # 计算耗时
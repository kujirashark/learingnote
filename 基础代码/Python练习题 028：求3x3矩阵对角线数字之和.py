'''
求一个3*3矩阵对角线元素之和。
'''

# str = input('请输入9个数字，用空格隔开，以形成3*3矩阵：')
# n = [int(i) for i in str.split(' ')]  #获取9个数字
# mx = []  #存储矩阵
# for i in range(3):
#     mt = []  #收集矩阵中每行的数字列表
#     for j in range(3):
#             mt.append(n[i*3 + j])
#     mx.append(mt)  #每行数字存储进mx列表
#     print(mt)
# sum1 = 0
# sum2 = 0
# for i in range(3):
#     sum1 += mx[i][i]
#     sum2 += mx[2-i][i]
# print('\方向对角线3元素之和为：%s' % sum1)
# print('/方向对角线3元素之和为：%s' % sum2)



'''
只要将代码稍微改一下，就可以接受任意 n*n 矩阵的计算了，而且数字数目输入有误时，也可以提示重新输入。改后代码如下：
'''
import math

err = True
while err:
    str = input('请输入n**2个数字，用空格隔开，以形成n*n的矩阵：')
    n = [int(i) for i in str.split(' ')]  # 获取9个数字
    t = math.floor(math.sqrt(len(n)))
    if t == math.sqrt(len(n)) and t != 1:
        err = False
    else:
        print('您输入的数字个数有误，请重试。')
mx = []  # 存储矩阵
for i in range(t):
    mt = []  # 收集矩阵中每行的数字列表
    for j in range(t):
        mt.append(n[i * t + j])
    mx.append(mt)  # 每行数字存储进mx列表
    print(mt)
sum1 = 0
sum2 = 0
for i in range(t):
    sum1 += mx[i][i]
    sum2 += mx[t - 1 - i][i]
print('\方向对角线元素之和为：%s' % sum1)
print('/方向对角线元素之和为：%s' % sum2)
'''
有一分数序列：2/1，3/2，5/3，8/5，13/8，21/13...求出这个数列的前20项之和。
'''

'''
规律是：后一个分数的分子=前一个分数的分子+分母，后一个分数的分母=前一个分数的分子，循环个20次就有结果。
注意，假设分子为a，分母为b，虽然 a = a + b，但此时a已经变成 a+b 了，所以再给b重新赋值的时候，
得是 (a+b)-b 才能等于原分母b，所以重新赋值时就得写成 a-b。
'''
# sum = 0
# a, b = 2, 1
# for i in range(200):
#     sum = sum + a/b
#     a = a + b
#     b = a - b
# print(sum)


'''
不过，话说原题用的是分数，经过这么一计算，成了浮点数，精度上会不会有问题呢？
想来想去，还是保持分数的形式比较精确吧……一查，发现计算分数时得from fractions import Fraction才能用。
'''
from fractions import Fraction

sum = 0
a, b = 2, 1
for i in range(20):
    sum = sum + Fraction(a / b)
    a = a + b
    b = a - b
print(sum)


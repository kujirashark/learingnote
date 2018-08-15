'''
一个数如果恰好等于它的因子之和，这个数就称为“完数”。例如6=1＋2＋3。编程找出1000以内的所有完数。

只要数字a能被数字b整除，不论b是不是质数，都算是a的因子。比如：8的质因子是 2, 2, 2，但8的因子就包括 1,2,4。
这么算来，求解“因子”可就比“质因子”简单多了，因为不用担心质因子重复的问题。

'''

import math

for i in range(2, 1000):
    factors = []  # 因子列表，i 每次循环都清空
    for j in range(1, math.floor(i / 2) + 1):
        if i % j == 0:
            factors.append(j)
    if sum(factors) == i:
        print(i, end=',')
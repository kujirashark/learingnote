'''
n！意味着n ×（n -1）×...×3×2×
例如，10！= 10×9×...×3×2×1 = 3628800，
并且数字10的数字之和！是3 + 6 + 2 + 8 + 8 + 0 + 0 = 27。
找到数字100的总和！
'''

n = 100
fac = 1  # 初始化阶乘结果
while n >= 1:
    fac *= n
    n -= 1

# 提取出阶乘结果的每个数字，形成列表lst
lst = [int(i) for i in str(fac)]

res = 0  # 初始化相加结果
for i in range(len(lst)):
    res += lst[i]
print(res)


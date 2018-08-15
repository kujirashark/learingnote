'''
输入三个整数x,y,z，请把这三个数由小到大输出。

'''

'''
这题想想应该比较容易：无非是先获取3个数字，然后比大小，按顺序输出即可。
不过在写代码的过程中遇到了个难题：因为担心输入时输入非指定的分隔符，需要指定多个分隔符（英文逗号、中文逗号、空格），
但 str.split() 只接受1个分隔符。发现可以用正则表达式解决这个问题，于是就有了 import re 这一行了。代码如下：
'''

# import re
#
# x, y, z = re.split(',| |，|  ', input('请输入3个数字，用逗号或空格隔开：'))
# x, y, z = int(x), int(y), int(z)
#
# maxNo = max(x, y, z)
# minNo = min(x, y, z)
# print(maxNo, x + y + z - maxNo - minNo, minNo)


'''
思路是：用 re.split() 得到 3 个字符型数字的列表，把字符转换为数字，排下序，然后 print() 不就都解决了吗？
'''

import re

lst = re.split(',| |，|  ', input('请输入3个数字，用逗号或空格隔开：'))
for i in range(len(lst)):
    lst[i] = int(lst[i])
lst.sort()
print(lst)
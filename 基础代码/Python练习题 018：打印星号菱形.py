'''
打印出如下图案（菱形）：

   *
  ***
 *****
*******
 *****
  ***
   *

'''

'''
只要知道Python的内置方法 str.center(width [, fillchar])就能轻而易举
打印出来：str即是数量不等的星号，width即是最大宽度（7个空格），默认填充字符fillchar就是空格。两个for循环搞定！
'''
# s = '*'
# for i in range(1, 8, 2):
#     print((s*i).center(7))
# for i in reversed(range(1, 6, 2)):
#     print((s*i).center(7))


'''
如果不用 str.center() 这题也不难解，无非是明确把空格的数量计算出来而已。
'''
s = '*'
for i in range(1,8,2):
    t = (7-i)//2
    print(' '*t + s*i + ' '*t)
for i in reversed(range(1,6,2)):
    t = (7-i)//2
    print(' '*t + s*i + ' '*t)
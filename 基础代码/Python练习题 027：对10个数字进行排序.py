'''
对10个数字进行排序。

用 str.split(' ') 获取输入的10个数字，然后用 lst.sort() 就完成排序了。代码如下;
'''


s = input('请输入10个数字，以空格隔开：')
n = [int(x) for x in s.split(' ')]
n.sort()
print(n)


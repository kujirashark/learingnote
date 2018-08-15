'''
求100以内的素数。
'''

p = [i for i in range(2,100)] #建立2-99的列表
for i in range(3,100): #1和2都不用判断，从3开始
    for j in range(2, i):
        if i%j == 0:
            p.remove(i)
            break
print(p)
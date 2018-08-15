'''
找出前100个自然数的平方和与平方和的差值。
'''

x = y = 0
for i in range(1, 101):
    x += i
    y += i**2
print(x**2 - y)
def f(x):  #判断 x 是否为素数，返回bool值
    if x == 2:
        return True
    elif x <= 1:
        return False
    else:
        t = False  #判断是否能够整除
        for i in range(2, int(x**.5)+1):
            if x%i == 0:
                t = True
                break
        if t:  #若能整除
            return False
        else:
            return True
sum = 0
n = int(input('请您输入n：'))
for i in range(1, n):
    if f(i):
        sum += i
print(sum)
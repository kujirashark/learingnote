'''
大致思路是：把数字挨个儿转换成英文表达方式，累加起来，然后用 len() 计算总字符的长度即可。
'''
n1 = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
n2 = ['', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
n3 = ['', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']

sum = ''  # 所有数字的英文表达累加

for i in range(1, 1001):
    baiwei = i // 100  # 百位数
    shiwei = (i - baiwei * 100) // 10  # 十位数
    gewei = i % 10  # 个位数
    eng = ''  # 当前数字的英文写法

    if i == 1000:
        eng += 'onethousand'
    elif i % 100 == 0:  # 若为整百的
        eng = n1[baiwei] + 'hundred'
    elif i > 100:
        eng = eng + n1[baiwei] + 'hundredand'
        if shiwei == 1 and gewei != 0:
            eng += n2[gewei]
        else:
            eng = eng + n3[shiwei] + n1[gewei]
    elif i > 19:
        eng = eng + n3[shiwei] + n1[gewei]
    elif i > 10:
        eng += n2[gewei]
    elif i == 10:
        eng += 'ten'
    else:
        eng += n1[gewei]
    sum += eng  # 累加各个数字的英文表达

print(len(sum))
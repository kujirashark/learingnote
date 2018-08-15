'''
输入一行字符，分别统计出其中英文字母、空格、数字和其它字符的个数。

这题也不难，逻辑很清楚，只要知道 ASCII 码表的对应值，知道 ord('a') 能将字符 'a' 转化为 ASCII 码表上对应的数值，就可以了。
其中，数字 0-9 对应的码值为 48-57，大写字母 A-Z 对应 65-90，小写字母 a-z 对应 97-122。
判断的时候应注意：'2' in range(3) 的结果是 False，因为 '2' 是字符，而 range(3) 包含的全是数字。 ord('2') in range(3) 的结果则是 True。
'''

lst = list(input('请输入一行字符，可以是任意字符：'))

iLetter = []
iSpace = []
iNumber = []
iOther = []

for i in range(len(lst)):
    if ord(lst[i]) in range(65, 91) or ord(lst[i]) in range(97, 123):
        iLetter.append(lst[i])
    elif lst[i] == ' ':
        iSpace.append(' ')
    elif ord(lst[i]) in range(48, 58):
        iNumber.append(lst[i])
    else:
        iOther.append(lst[i])

print('中英文字母个数：%s' % len(iLetter))
print('空格个数：%s' % len(iSpace))
print('数字个数：%s' % len(iNumber))
print('其它字符个数：%s' % len(iOther))
'''
思路：先判断是否为闰年，这关系到 2 月份的天数。之后再根据月份值把前几个月的天数累积加起来，最后再加上个“日”，就可以了。
'''

# dat = input('请输入某年某月某日，格式为 yyyy-mm-dd ：')
# y = int(dat[0:4])  #获取年份
# m = int(dat[5:7])  #获取月份
# d = int(dat[8:])  #获取日
#
# ly = False
#
# if y%100 == 0:  #若年份能被100整除
#     if y%400 == 0:  #且能被400整除
#         ly = True  #则是闰年
#     else:
#         ly = False
# elif y%4 == 0:  #其它情况下，若能被4整除
#     ly = True  #则为闰年
# else:
#     ly = False
#
# if ly == True:  #若为闰年，则2月份有29天
#     ms = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
# else:
#     ms = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
#
# days = 0
# for i in range(1, 13):  #从1到12逐一判断，以确定月份
#     if i == m:
#         for j in range(i-1):  #确定月份i之后，则将ms列表中的前i-1项相加
#             days += ms[j]
#         print('%s是该年份的第%s天。' % (dat, (days + d))) #最后再加上“日”，即是答案



'''
import datetime
 
y = int(input('请输入4位数字的年份：'))  #获取年份
m = int(input('请输入月份：'))  #获取月份
d = int(input('请输入是哪一天：'))  #获取“日”
 
targetDay = datetime.date(y, m, d)  #将输入的日期格式化成标准的日期
print(targetDay - datetime.date(targetDay.year-1, 12, 31))  #减去上一年最后一天，可得解

思路也很简单：获取目标日期，然后减去上一年度的最后一天，就可以得出该日期是当年的第几天。
'''



'''
可以用 datetime.timedelta.days 轻松提取天数。更新代码如下：

import datetime
 
y = int(input('请输入4位数字的年份：'))  #获取年份
m = int(input('请输入月份：'))  #获取月份
d = int(input('请输入是哪一天：'))  #获取“日”
 
targetDay = datetime.date(y, m, d)  #将输入的日期格式化成标准的日期
dayCount = targetDay - datetime.date(targetDay.year - 1, 12, 31)  #减去上一年最后一天

print('%s是%s年的第%s天。'% (targetDay, y, dayCount.days))
'''
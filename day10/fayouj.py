# coding:utf-8

import os, sys
import smtplib
import time
from email.header import Header
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

reportPath = os.path.join(os.getcwd(), 'report')  # 测试报告的路径


# reportPath = os.path.join(os.path.dirname(os.path.abspath(sys.argv[0])),'report')

class SendMail(object):
    def __init__(self, recver=None):
        """接收邮件的人：list or tuple"""
        if recver is None:
            self.sendTo = ['lizhonglin25@126.com']  # 收件人这个参数，可以是list，或者tulp，以便发送给多人
        else:
            self.sendTo = recver

    def get_report(self):  # 该函数的作用是为了在测试报告的路径下找到最新的测试报告
        dirs = os.listdir(reportPath)
        dirs.sort()
        newreportname = dirs[-1]
        print('The new report name: {0}'.format(newreportname))
        return newreportname  # 返回的是测试报告的名字

    def take_messages(self):  # 该函数的目的是为了 准备发送邮件的的消息内容
        newreport = self.get_report()
        self.msg = MIMEMultipart()
        self.msg['Subject'] = '你的工资'  # 邮件的标题
        self.msg['date'] = time.strftime('%a, %d %b %Y %H:%M:%S %z')

        with open(os.path.join(reportPath, newreport), 'rb') as f:
            mailbody = f.read()  # 读取测试报告的内容
        html = MIMEText(mailbody, _subtype='html', _charset='utf-8')  # 将测试报告的内容放在 邮件的正文当中
        self.msg.attach(html)  # 将html附加在msg里

        # html附件    下面是将测试报告放在附件中发送
        att1 = MIMEText(mailbody, 'base64', 'gb2312')
        att1["Content-Type"] = 'application/octet-stream'
        att1["Content-Disposition"] = 'attachment; filename="TestReport.html"'  # 这里的filename可以任意写，写什么名字，附件的名字就是什么
        self.msg.attach(att1)

    def send(self):
        self.take_messages()
        self.msg['from'] = 'lizhonglin25@126.com'  # 发送邮件的人
        smtp = smtplib.SMTP('smtp.126.com', 25)  # 连接服务器
        smtp.login('lizhonglin25@126.com', 'liyibo120405@')  # 登录的用户名和密码
        smtp.sendmail(self.msg['from'], self.sendTo, self.msg.as_string())  # 发送邮件
        smtp.close()
        print('sendmail success')


if __name__ == '__main__':
    sendMail = SendMail()
    sendMail.send()


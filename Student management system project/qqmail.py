# coding:utf-8
import smtplib
from email.mime.text import MIMEText
from email.header import Header

# 第三方 SMTP 服务
mail_host = "smtp.qq.com"  # 设置服务器
mail_user = "445144399@qq.com"  # 用户名
mail_pass = "xvtnkheipsubcbeg"  # 口令,QQ邮箱是输入授权码，在qq邮箱设置 里用验证过的手机发送短信获得，不含空格

sender = '445144399@qq.com'
receivers = ['lizhonglin25@126.com']  # 接收邮件，可设置为你的QQ邮箱或者其他邮箱

message = MIMEText('offer ', 'plain', 'utf-8')
# message['From'] = Header("ppyy", 'utf-8')
message['From'] = Header("445144399@qq.com", 'utf-8')
# message['To'] = Header("you", 'utf-8')
message['To'] = Header("lizhonglin25@126.com", 'utf-8')

subject = '我的祝福'
message['Subject'] = Header(subject, 'utf-8')

try:
    smtpObj = smtplib.SMTP_SSL(mail_host, 465)
    smtpObj.login(mail_user, mail_pass)
    smtpObj.sendmail(sender, receivers, message.as_string())
    smtpObj.quit()
    print("邮件发送成功")
except smtplib.SMTPException as e:
    print(e)

##### python+mysql实现通讯录功能

```python
import pymysql


#连接Mysql数据库
def contentDB():
    # 创建数据库配置项
    config = {
        'host': '127.0.0.1',
        'user': 'root',
        'passwd': '123456',
        'db': 'address_Book',
        'charset': 'utf8'
    }
    # 连接数据库
    return pymysql.connect(**config)


#创建通讯录表
def createTable(conn):
    try:
        with conn.cursor() as cursor:
            cursor.execute(
               """create table tb_phone(
                pid int not null auto_increment,
                pname varchar(20) not null,
                phone char(11) not null,
                email varchar(30) not null,
                primary key(pid)
                );""")
            conn.commit()
    finally:
        conn.close()


#查询通讯录中的某个人
def selectData(conn):
    try:
        with conn.cursor() as cursor:
            print('4.查询联系人')
            name = input('请输入姓名:')
            cursor.execute('select pname,phone,email from tb_phone where pname=%s',(name,))
            result = cursor.fetchone()
            #判断通讯录中是否有输入的那个人
            if result == None:
                print('通讯录中没有:%s' % name)
            else:
                print('-----' * 5)
                print('姓名:%s' % result[0])
                print('电话:%s' % result[1])
                print('邮箱:%s' % result[2])
                print('-----' * 5)
    finally:
        conn.close()

#查询通讯录中的所有人
def selectAllData(conn):
    try:
        with conn.cursor() as cursor:
            print('5.显示所有联系人')
            cursor.execute('select pname,phone,email from tb_phone')
            result = cursor.fetchone()
            ##判断通讯录中是否有记录
            if result == None:
                print('通讯录中没有人')
            else:
                while result:
                    if result != None:
                        print('-----' * 5)
                        print('姓名:%s' % result[0])
                        print('电话:%s' % result[1])
                        print('邮箱:%s' % result[2])
                        print('-----' * 5)
                    else:
                        print('通讯录中没有人')
                    result = cursor.fetchone()
    finally:
        conn.close()

#往通讯录中插入记录
def insertData(conn):
    try:
        with conn.cursor() as cursor:
            print('1.新增联系人')

            name = input('姓名:')
            phone = input('电话:')
            email = input('邮箱:')
            cursor.execute(
               'insert into tb_phone (pname,phone,email) values (%(name)s, %(phone)s, %(email)s)',
                {'name': name,'phone': phone,'email': email})
            conn.commit()
            print('通讯录更新成功!')
    finally:
        conn.close()


#更新通讯录中的数据
def updateData(conn):
    try:
        with conn.cursor() as cursor:
            print('3.修改联系人')
            name = input('输入姓名:')
            # 查询是否有此人
            cursor.execute('select pname,phone,email from tb_phone where pname=%s',(name))
            result = cursor.fetchone()
            #判断是否有数据,有数据就显示出来,没有数据就提示用户输入
            if result != None:
                print('-----' * 5)
                print('姓名:%s' % result[0])
                print('电话:%s' % result[1])
                print('邮箱:%s' % result[2])
                print('-----' * 5)
                print('1.电话号码.  2.邮箱.')
                # 选择修改的选项
                temp = input('请选择要修改的信息:')
                while True:
                    if temp == '1':
                        tel = input('新号码:')
                        cursor.execute('update tb_phone set phone=%s where pname=%s',(tel,name))
                        conn.commit()
                        print('电话号码修改成功')
                        break
                    elif temp == '2':
                        email = input('新Email:')
                        cursor.execute('update tb_phone set email=%s where pname=%s',(email,name))
                        conn.commit()
                        print('电话号码修改成功')
                        break
                    else:
                        print('输入选项错误')
                        temp = input('请选择要修改的信息:')
            else:
                print('通讯录中没有此人,请重新添加')
    finally:
        conn.close()


#删除通讯录的某个人
def deleteTable(conn):
    try:
        with conn.cursor() as cursor:
            print('2.删除联系人')
            name = input('请输入要删除的姓名:')
            result = cursor.execute(
                'delete from tb_phone where pname=%s',(name,))
            conn.commit()
            print('已删除成功%s'%name if result == 1 else '通讯录中没有:%s'%name )
    finally:
        conn.close()


#定制通讯录菜单
def menu():
    print('+++' * 5)
    print('  通讯录管理系统  ')
    print('+++' * 5)
    print('1.新增联系人')
    print('2.删除联系人')
    print('3.修改联系人')
    print('4.查询联系人')
    print('5.显示所有联系人')
    print('6.退出程序')
    print('+++' * 5)


def main():
    #显示菜单
    menu()
    operation = input('请输入功能号:')
    #连接数据库
    conn = contentDB()
    while True:
        if operation == '1':
            insertData(conn)
            break
        elif operation == '2':
            deleteTable(conn)
            break
        elif operation == '3':
            updateData(conn)
            break
        elif operation == '4':
            selectData(conn)
            break
        elif operation == '5':
            selectAllData(conn)
            break
        elif operation == '6':
            print('已退出系统')
            break
        else:
            print('选项输入错误,没有此功能')
            operation = input('请输入功能号:')

if __name__ == '__main__':
    main()
```
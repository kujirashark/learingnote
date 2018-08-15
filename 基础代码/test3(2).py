from time import sleep


def add_student():
    stuID = 20181803000
    flag2 = True
    while flag2:
        name = input('请输入学生姓名：')
        age = input('请输入学生年龄：')
        tel = input('请输入学生电话号码：')
        stuID += 1
        stuDict = {name_key: name, age_key: age, tel_key: tel, stuID_key: stuID}
        allStuDict[stuID] = stuDict
        flag3 = True
        while flag3:
            print('1.返回上一级')
            print('2.继续添加学生信息')
            print('===========================')
            orderStr1 = input('请输入指令：')
            if orderStr1 == '1':
                flag2 = False
                flag3 = False
            elif orderStr1 == '2':
                flag3 = False
            else:
                print('请输入正确的指令！')


def seek_student():
    flag4 = True
    while flag4:
        print('1.查看所有的学生信息')
        print('2.输入名字查看学生信息')
        print('3.返回上一级')
        print('===========================')
        orderStr2 = input('请输入指令：')
        if orderStr2 == '1':
            for key in allStuDict:
                find_student = allStuDict[key]
                print(
                    'name:%s, age:%s, tel:%s' % (find_student[name_key], find_student[age_key], find_student[tel_key]))
        elif orderStr2 == '2':
            find_name = input('请输入要查看的学生的姓名：')
            flag5 = True
            for x in allStuDict:
                find_student = allStuDict[x]
                if find_name == find_student[name_key]:
                    print('name:%s, age:%s, tel:%s' % (
                    find_student[name_key], find_student[age_key], find_student[tel_key]))
                    flag5 = False
            if flag5:
                print('查询不到%s的信息，请核实！' % find_name)
        elif orderStr2 == '3':
            flag4 = False
        else:
            print('请输入正确的指令！')


def del_student():
    flag6 = True
    while flag6:
        print('1.返回上一级')
        print('2.进入删除')
        print('===========================')
        orderStr3 = input('请输入指令：')
        if orderStr3 == '1':
            flag6 = False
        elif orderStr3 == '2':
            del_name = input('请输入要删除的学生姓名：')
            del_stu_list = []
            for x in allStuDict:
                del_stu = allStuDict[x]
                if del_name == del_stu[name_key]:
                    del_stu_list.append(del_stu)
            if len(del_stu_list):
                index = 0
                for i in del_stu_list:
                    print('%d name:%s, age:%s, tel:%s' % (index, i[name_key], i[age_key], i[tel_key]))
                    index += 1
                value = int(input('请输入要删除学生编号：'))
                if value < len(del_stu_list):
                    del_stu = del_stu_list[value]
                    allStuDict.pop(del_stu[stuID_key])
                    print('删除成功')
                else:
                    print('输入有误')
            else:
                print('查询不到%s的信息，请核实！' % del_name)
        else:
            print('请输入正确的指令！')


def display():
    print('# 欢迎进入千峰学生管理系统')
    print('1.添加学生信息')
    print('2.查找学生信息')
    print('3.删除学生信息')
    print('q.退出系统')


flag1 = True
allStuDict = {}
stuDict = {}
name_key = 'name'
age_key = 'age'
tel_key = 'tel'
stuID_key = 'stuID'
while flag1:
    # print('# 欢迎进入千峰学生管理系统')
    # print('1.添加学生信息')
    # print('2.查找学生信息')
    # print('3.删除学生信息')
    # print('q.退出系统')
    display()
    print('===========================')
    orderStr = input('请输入指令：')
    if orderStr == '1':
        add_student()
    elif orderStr == '2':
        seek_student()
    elif orderStr == '3':
        del_student()
    elif orderStr == 'q':
        flag1 = False
        print('您正在退出系统……！')
        sleep(2)
        print('退出成功。')
    else:
        print('请输入正确的指令。')
---
title: Django中多条件查询解决方法
date: 2018-08-07 19:10:46
tags: django中对条件查询
---

###### 一些cms项目都会使用到多条件查询,我们后端如何处理请求的条件呢?

1. 满足一个条件 

2. 满足两个条件

3. 满足多个条件

4. ………………….

   ​

这样处理起来会非常的老火. 其实有多方法比如(传参数,传字典,传Q对象,传F对象....)陷入深深的思考中................................怎么用做简单的方法把这个需求解决了.

个人觉得.把我们的查询的所有条件来构建一个字典来查询起来比较高效.具体如何操作见下面的代码:

视图函数.

```python
def order_list(request):
    
    if request.method == 'GET':
        return render(request, 'admin/order_list.html')

    if request.method == 'POST':
        # 获取案件号
        case_order = request.POST.get('case_order')
        # 获取客户姓名
        case_name = request.POST.get('case_name')
        # 获取身份证号码
        idno = request.POST.get('idno')
        # 获取贷款日期
        loan_date = request.POST.get('loan_date')
        # 获取贷款状态
        state = request.POST.get('state')
        # 获取贷款类型
        dk_type = request.POST.get('dk_type')

        # 定一个字典用于保存前端发送过来的查询条件
        search_dict = dict()
        # 如果有这个值 就写入到字典中去
        if case_order:
            search_dict['loan_id'] = case_order
        if case_name:
            search_dict['name'] = case_name
        if idno:
            search_dict['user_card'] = idno
        if loan_date:
            search_dict['pri_date'] = loan_date
        if state:
            # 通过关联关系查询出来需要的数据
            state_info = StatuTable.objects.filter(statu_name=state).first()

            search_dict['statu_id'] = state_info.statu_id
        if dk_type:
            loa = LoantypeTable.objects.filter(loan_name=dk_type).first()
            search_dict['loa_loan_id'] = loa.loan_id

        # 多条件查询 关键点在这个位置传如的字典前面一定要加上两个星号.
        user_order_info = UserTable.objects.filter(**search_dict)
        # 序列化
        data_info = [user_order.to_dict() for user_order in user_order_info]

        data = {
            'code': 200,
            'data_info': data_info
        }
        return JsonResponse(data)
```

###### Models见上一篇文章

###### [传送门 Model](https://leezhonglin.github.io/2018/08/06/django%E4%BD%BF%E7%94%A8xlwt%E5%AF%BC%E5%87%BAexcel%E6%96%87%E4%BB%B6/#more)



###### 前端html页面

```html
<head>
    // 使用jquery就必须引入
	<script src="/static/admin/js/jquery.js" type="text/javascript"></script>
    // 需要使用ajaxSubmit去提交表单就必须引入
    <script src="/static/admin/js/jquery.form.min.js" type="text/javascript"></script>
    // 使用template.js渲染页面就必须引入
    <script src="/static/admin/js/template.js" type="text/javascript"></script>
    <script src="/static/admin/js/order_list.js" type="text/javascript"></script>
</head>

<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="order"></i><em>查询还款案件</em></span>
    </div>
    <div class="operate">
        <form id="search-order">
            {% csrf_token %}
            <div>
                <div style="margin: 10px">
                    <label for="">客户单号:</label>
                    <input type="text" class="textBox length-long " name="case_order" value=""/>

                    <label for="">客户名称:</label>
                    <input type="text" class="textBox length-long " name="case_name" value=""/>
                </div>

                <div style="margin: 10px">
                    <label for="">身份证号:</label>
                    <input type="text" class="textBox length-long " name="idno" value=""/>

                    <label for="">贷款日期:</label>
                    <input type="text" class="textBox length-long" id="datepicker" name="loan_date" value=""/>
                </div>

                <div style="margin: 10px">
                    <label for="">处理状态:</label>
                    <select class="inline-select textBox length-long" name="state">
                        <option value="未处理">未处理</option>
                        <option value="已处理">已处理</option>
                    </select>
                    <label for="">贷款项目:</label>
                    <select class="inline-select textBox length-long" name="dk_type">
                        <option value="POS贷">POS贷</option>
                        <option value="现金贷">现金贷</option>
                    </select>
                    <div style="margin-right: 20px;margin-top: 10px;">
                        <input type="submit" value="查询" class="tdBtn"/>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <table class="list-style Interlaced" id="test">
        <tr>
            <th>申请编号</th>
            <th>客户名称</th>
            <th>联系方式</th>
            <th>身份证号码</th>
            <th>办理日期</th>
            <th>处理人</th>
            <th>处理状态</th>
            <th>处理时间</th>
            <th>操作</th>
        </tr>
        {% verbatim %}
        <script type="text/html" id="tr_list">
            {{ each users as user }}
            <tr>
                <td>
                    <input type="checkbox"/>
                    <a href="/admin/order_detail/?id={{ user.user_id }}" style="text-decoration:underline; color: blue">
                        <span>{{ user.loan_id }}</span>
                    </a>
                </td>
                <td class="center">
                    <span class="block">{{ user.name }}</span>
                </td>
                <td width="200" style="text-align:center">
                    <span class="block">{{ user.phone }}</span>
                </td>
                <td class="center">
                    <span>{{ user.card }}</span>
                </td>
                <td class="center">
                    <span>{{ user.date }}</span>
                </td>
                <td class="center">
                    <span>{{ user.deal_peo }}</span>
                </td>
                <td class="center">
                    <span>{{ user.status }}</span>
                </td>
                <td class="center">
                    <span>{{ user.deal_time }}</span>
                </td>
                <td class="center">
                    <a href="/admin/order_detail/?id={{ user.user_id }}" class="inline-block" title="查看案件"><img
                            src="/static/admin/images/icon_view.gif"/></a>
                    <a class="inline-block" title="删除案件">
                        <img src="/static/admin/images/icon_trash.gif"/>
                    </a>
                </td>
            </tr>
            {{ /each }}
        </script>
        {% endverbatim %}
    </table>
    <!-- BatchOperation -->
    <div style="overflow:hidden;">
        <!-- Operation -->
        <div class="BatchOperation fl">
            <input type="checkbox" id="del"/>
            <label for="del" class="btnStyle middle">全选</label>
            <a href="/admin/export_excel/"><button id="export_excel" type="button" class="btnStyle" >导出excel</button></a>
            <input type="button" value="删除案件" class="btnStyle"/>
        </div>
```



###### 后端搞定了就可以在前端写ajax去渲染页面了.

```javascript
$(function () {
    var token = $(':input[name="csrfmiddlewaretoken"]').val()
    $('#search-order').submit(function () {
        $(this).ajaxSubmit({
            url: '/admin/order_list/',
            dataType: 'json',
            type: 'POST',
            headers: {'X-CSRFToken': token},
            success: function (data) {
                if (data.code == 200) {
                    var html ='<tr>\n' +
                        '            <th>申请编号</th>\n' +
                        '            <th>客户名称</th>\n' +
                        '            <th>联系方式</th>\n' +
                        '            <th>身份证号码</th>\n' +
                        '            <th>办理日期</th>\n' +
                        '            <th>处理人</th>\n' +
                        '            <th>处理状态</th>\n' +
                        '            <th>处理时间</th>\n' +
                        '            <th>操作</th>\n' +
                        '        </tr>'

                    var tr_html = template('tr_list', {users: data.data_info})
                    html += tr_html
                    $('#test').html(html)
                }
            }
        })
        // 阻止默认提交
        return false;
    })
})
```

>总结: 
>
>重点就在怎么构建字典后最后构建好的字段如何传参的问题.

##### 本文原创出品.欢迎收藏转载!!!!

>**作 者:** lizhonglin
>
>**github:** <https://github.com/Leezhonglin/>
>
>**blog:** <https://leezhonglin.github.io/>


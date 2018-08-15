#### ajax写法

###### 1.方式一

```javascript
1.方式一
$.ajax({
	url:'',
    type:'',
    dataType:'',
    data:'',
    headers:'',
    success:function(msg){
        
    },
    error: function(msg){
        
    }
});
```

###### 2: 方式二 get请求简写

```javascript
$.get(url,function(msg){
    
});
```

###### 3: 方式三 post请求简写

```javascript
$.post(url,data,function(msg){
    
});
```

###### 4: 方式四 提交上传文件

```javascript
$(this).ajaxSubmit({
    url:'',
    type:'',
    dataType:'',
    data:'',
    headers:'',
    success:function(msg){   
    },
    error: function(msg){
        
    }
})
return false;  //阻止主动第二次提交
```

###### 5, 前端有多个值需要获取

```javascript
$('#form-house-info').submit(function () {
    var a = $(this).serialize() //获取多个值
    $.post('/house/newhouseinfo/', a ,function (data) {

        if (data.code == '200'){
            location.href = '/house/myhouse/'
        }
    });
    return false;
});
```


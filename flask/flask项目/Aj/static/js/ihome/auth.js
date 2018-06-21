function showSuccessMsg() {
    $('.popup_con').fadeIn('fast', function() {
        setTimeout(function(){
            $('.popup_con').fadeOut('fast',function(){}); 
        },1000) 
    });
}

//PATCH请求提交数据到后端
$(document).ready(function () {
    $('#form-auth').submit(function () {
        $.ajax({
            url:'/user/auth/',
            type:'PATCH',
            dataType:'json',
            data:{'real_name':$('#real-name').val(),'id_card':$('#id-card').val()},
            success: function (msg) {
                if (msg.code == '200'){
                    $('.btn-success').hide()
                }
            },
            error:function (msg) {
                alert('请求失败')
            }
        });
        return false;
    });
});

//实名认证后获取数据显示页面并且隐藏保存按钮
$.get('/user/authinfo/',function (msg) {
    if(msg.code == '200'){
        if(msg.data.id_name){
            $('#real-name').val(msg.data.id_name);
            $('#id-card').val(msg.data.id_card);
            $('.btn-success').hide()
        }
    }
});
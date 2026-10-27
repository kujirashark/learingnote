function showSuccessMsg() {
    $('.popup_con').fadeIn('fast', function() {
        setTimeout(function(){
            $('.popup_con').fadeOut('fast',function(){}); 
        },1000) 
    });
}

function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}

$(document).ready(function () {
    $('#form-avatar').submit(function () {
       $(this).ajaxSubmit({
           url:'/user/profile/',
           dataType:'json',
           type: 'PATCH',
           success: function (data) {
               $('#user-avatar').attr('src','/static/' + data.image_url)
           },
           error: function (data) {
               alert('请求失败')
           }
       });
       return false;
    });

    $('#form-name').submit(function () {
        $.ajax({
            url:'/user/profile/name/',
            type: 'PATCH',
            dataType:'json',
            data:{'name': $('#user-name').val()},
            success: function (msg) {
                if(msg.code == '1009'){
                    $('.error-msg').text(msg.msg)
                    $('.error-msg').show()
                }
            },
            error: function (msg) {
                alert('请求错误')
            }
        });
        return false;
    });
});

function delete_msg() {
    $('.error-msg').hide();
}

$.get('/user/profile_img/',function (msg) {
         //alert('/static/'+ msg.data.avatar)
        // alert(msg.data.name)
    $('#user-avatar').attr('src','/static/'+ msg.data.avatar)
    $('#user-name').attr('value',msg.data.name)
    // $('#user_avatar').show()
    // $('#user-name').show()


    });
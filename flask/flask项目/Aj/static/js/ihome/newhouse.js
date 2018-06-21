function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}

$(document).ready(function(){
    // $('.popup_con').fadeIn('fast');
    // $('.popup_con').fadeOut('fast');
})

$.get('/house/house_info/',function (msg) {
    if (msg.code == '200'){
        var area_str = ''
        for (var i = 0;i<msg.areas_list.length; i++){
           area_option = '<option value='+ msg.areas_list[i].id +'>'+ msg.areas_list[i].name +'</option>'
           area_str += area_option
        }
         $('#area-id').html(area_str)

        var facility_str = ''
        for (var j = 0; j<msg.facilitys_list.length; j++ ){
            facility_li = '<li><div class="checkbox"><label><input type="checkbox" name="facility"'
            facility_li +=  'value='+ msg.facilitys_list[j].id +'>'+ msg.facilitys_list[j].name +'</label></li>'
            facility_str += facility_li
        }
        $('.house-facility-list').html(facility_str)
    }
});


$('#form-house-info').submit(function () {
    var a = $(this).serialize()
    $.post('/house/newhouseinfo/', a ,function (data) {
        if (data.code == '200'){
            $('#form-house-info').hide();
            $('#form-house-image').show();
            $('#house-id').val(data.house_id)
        }
    });
    return false;
});

$('#form-house-image').submit(function () {
   $(this).ajaxSubmit({
        url:'/house/houseimg/',
        type:'POST',
        dataType:'json',
        success: function (msg) {
            if (msg.code == '200'){
                var image_img = '<img src="/static/'+ msg.image_url +'">';
                $('.house-image-cons').append(image_img);
            }
        },
        error: function (msg) {
            alert('请求失败')
        }
    });
    return false;
});
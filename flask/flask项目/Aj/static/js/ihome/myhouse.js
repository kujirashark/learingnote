$(document).ready(function(){
    $(".auth-warn").show();
});

$.get('/user/authinfo/',function (msg) {
    if (msg.code == '200'){
        if (msg.data.id_name){
            $('.auth-warn').hide();
            $('#houses-list').show()
        }else{
            $('.wuth-warn').show();
            $('#houses-list').hide()
        }
    }
});


$.get('/house/housing/',function (msg) {
    if (msg.code == '200' ){
        var house_str = '';
        for (var i = 0; i< msg.house_list.length; i++){
            var house_li = '<li><a href="/house/detail/?house_id='+ msg.house_list[i].id +'">';
            house_li += '<div class="house-title"><h3>房屋ID:'+ msg.house_list[i].id +'——'+ msg.house_list[i].title +'</h3></div>';
            house_li += '<div class="house-content"><img alt="" src="/static/'+ msg.house_list[i].image +'"><div class="house-text"><ul>';
            house_li += '<li>位于:'+ msg.house_list[i].area +'</li>' +
                        '<li>价格：￥'+ msg.house_list[i].price +'/晚</li>' +
                        '<li>发布时间：'+ msg.house_list[i].create_time +'</li>';
            house_li +=  '</ul></div></div></a></li>';
            house_str += house_li
        }
        $('#houses-list').append(house_str)
    }
});
function hrefBack() {
    history.go(-1);
}

function getCookie(name) {
    var r = document.cookie.match("\\b" + name + "=([^;]*)\\b");
    return r ? r[1] : undefined;
}

function decodeQuery(){
    var search = decodeURI(document.location.search);
    return search.replace(/(^\?)/, '').split('&').reduce(function(result, item){
        values = item.split('=');
        result[values[0]] = values[1];
        return result;
    }, {});
}

function showErrorMsg() {
    $('.popup_con').fadeIn('fast', function() {
        setTimeout(function(){
            $('.popup_con').fadeOut('fast',function(){}); 
        },1000) 
    });
}

$(document).ready(function(){
    $(".input-daterange").datepicker({
        format: "yyyy-mm-dd",
        startDate: "today",
        language: "zh-CN",
        autoclose: true
    });
    $(".input-daterange").on("changeDate", function(){
        var startDate = $("#start-date").val();
        var endDate = $("#end-date").val();

        if (startDate && endDate && startDate > endDate) {
            showErrorMsg();
        } else {
            var sd = new Date(startDate);
            var ed = new Date(endDate);
            days = (ed - sd)/(1000*3600*24) + 1;
            var price = $(".house-text>p>span").html();
            var amount = days * parseFloat(price);
            $(".order-amount>span").html(amount.toFixed(2) + "(共"+ days +"晚)");
        }
    });
});

var house_id = location.search.split('=')[1]
$.get('/house/detail/'+ house_id +'/', function (msg) {
    $('.house-info img').attr('src','/static/'+ msg.house_info.images[0])
    $('.house-text h3').text(msg.house_info.title);
    $('.house-text p span').text(msg.house_info.price);
});

function submit_order() {
    var startDate = $("#start-date").val();
    var endDate = $("#end-date").val();
    var house_id = location.search.split('=')[1]
    $.post('/order/create_order/',
        {'house_id':house_id,'begin_date':startDate,'end_date':endDate},
        function (msg) {
            alert(msg.code)
    });
}

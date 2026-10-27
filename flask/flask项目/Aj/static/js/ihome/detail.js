function hrefBack() {
    history.go(-1);
}

function decodeQuery() {
    var search = decodeURI(document.location.search);
    return search.replace(/(^\?)/, '').split('&').reduce(function (result, item) {
        values = item.split('=');
        result[values[0]] = values[1];
        return result;
    }, {});
}

$(document).ready(function () {
    var mySwiper = new Swiper('.swiper-container', {
        loop: true,
        autoplay: 2000,
        autoplayDisableOnInteraction: false,
        pagination: '.swiper-pagination',
        paginationType: 'fraction'
    })
    $(".book-house").show();

    var info = location.search;
    house_id = info.split('=')[1]
    $.get('/house/detail/' + house_id + '/', function (msg) {
        $('.house-price span').text(msg.house_info.price)
        $('.house-title').text(msg.house_info.title);
        $('.landlord-name span').text(msg.house_info.user_name);
        $('.text-center li').text(msg.house_info.address);
        $('#house_count').text('出租' + msg.house_info.room_count + '间');
        $('#hosue_acreage').text('房屋面积:' + msg.house_info.acreage + '平米');
        $('#house_unit').text('房屋户型:' + msg.house_info.unit);
        $('#house_capacity').text('宜住' + msg.house_info.capacity + '人');
        $('#house_beds').text(msg.house_info.beds);
        $('#house_deposit').text(msg.house_info.deposit);
        $('#house_min_days').text(msg.house_info.min_days);
        $('#house_max_days').text(msg.house_info.max_days);

        var image_str = '';
        for (var i = 0; i<msg.house_info.images.length;i++){
            img_li = ''
            img_li += '<li class="swiper-slide"><img src="/static/'+ msg.house_info.images[i] +'"></li>'
            image_str += img_li
        }
        $('.swiper-wrapper').append(image_str);

        var mySwiper = new Swiper('.swiper-container', {
        loop: true,
        autoplay: 2000,
        autoplayDisableOnInteraction: false,
        pagination: '.swiper-pagination',
        paginationType: 'fraction'
        })
        $(".book-house").show();

        var facility_str = ''
        for (var j = 0; j< msg.house_info.facilities.length; j++){

            facility_li = '';
            facility_li += '<li><span class="'+ msg.house_info.facilities[j].css +'"></span>'+ msg.house_info.facilities[j].name +'</li>'
            facility_str += facility_li
        }
        $('.house-facility-list').append(facility_str);
        // 即刻预订
        $('.book-house').attr('href', '/house/booking/?house_id=' + msg.house_info.id )
    })
});
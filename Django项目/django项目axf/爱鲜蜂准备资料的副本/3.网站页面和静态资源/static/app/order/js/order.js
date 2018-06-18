$(function () {

    $("#alipay").click(function () {

        var order_id = $(this).attr("orderid");

        console.log(order_id);
    //    调用支付宝支付，不小心就支付成功了
    //    想集成哪种支付就去相应的官网去认证  （企业，个人营业执照）    蚂蚁金服开放平台     Ping++
        $.getJSON("/axf/changeorderstatus/", {"status":"1","order_id":order_id}, function (data) {
            console.log(data);

            if (data["status"] == "200"){
                window.open("/axf/mine/", target="_self");
            }
        })
    })

})
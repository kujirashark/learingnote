function logout() {
    $.get("/user/logout/", function(data){
        if (data.code == 200){
            location.href ='/user/login/'
        }
    })
}

$(document).ready(function(){
});


$.get('/user/userinfo/',function (msg) {
        $('#user-avatar').attr('src','/static/' + msg.data.avatar)
        $('#user-name').text(msg.data.name)
        $('#user-mobile').text(msg.data.phone)

    });

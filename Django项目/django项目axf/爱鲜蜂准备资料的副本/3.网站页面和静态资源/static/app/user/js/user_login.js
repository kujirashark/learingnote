function check_input() {

    var password = $("#password").val();
    $("#password").val(md5(password));

    return true
}
let dup_check = false;

$(document).ready(function () {

    $('#form1').submit(function(event){
        let name = $("#username").val();
        let password = $("#password").val();

        if (dup_check === false) {
            name.focus();
            event.preventDefault();
            return false;
        }

        if (password == '') {
            password.focus();
            event.preventDefault();
            return false;
        }
    });

});

function duplicate_check() {
    let username = $("#username").val();

    if (username == '') {
        alert("아이디를 입력해주세요.");
        username.focus();
        return false;
    }

    $.ajax({
        url: '/members/' + username,
        type: 'GET',
        success: function(data) {
            if (data.username === undefined) {
                alert("사용 가능한 아이디입니다.");
                dup_check = true;
            } else {
                alert("이미 사용중인 아이디입니다.");
                dup_check = false;
                return false;
            }
        },
        error: function(xhr, status, error) {
            console.error("에러 발생: " + error);
        }
    });

}
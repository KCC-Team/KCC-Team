let dup_check = false;

$(document).ready(function () {

    $('#form1').submit(function(){
        let password = $("#password").val();

        if (dup_check === false) {
            alert("아이디 중복 확인 바랍니다.");
            return false;
        }

        if (password == '') {
            alert("비밀번호를 입력해주세요.");
            return false;
        }
    });

});

function duplicate_check() {
    let username = $("#username").val();

    if (username == '') {
        alert("아이디를 입력해주세요.");
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
            }
        },
        error: function(xhr, status, error) {
            console.error("에러 발생: " + error);
        }
    });

}
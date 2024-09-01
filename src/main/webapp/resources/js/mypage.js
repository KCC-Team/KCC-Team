$(document).ready(function () {
    var result = document.getElementById("result-container").getAttribute("data-result");
    if (result == 'updateSuccess') {
        alert("회원 정보가 수정되었습니다.");
    }

    $('#updateForm').submit(function(){
        let password = $("#password").val();
        if (password == '') {
            alert("비밀번호를 입력해주세요.");
            return false;
        }
    });

    $('#deleteForm').submit(function(){
        if (confirm("탈퇴하시겠습니까?")) {
        } else {
            return false;
        }
    });
});

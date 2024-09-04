$(function () {
  function getErrorParameter() {
    let search = window.location.search;
    let params = new URLSearchParams(search);
    return params.get('loginDenied');
  }
  let loginDenied = getErrorParameter();
  if (loginDenied) {
    alert(decodeURIComponent(loginDenied));
  }

  $(".register-content").hide();
  $("#way").on('change', function () {
    $(".register-content").hide();
    if ($(this).val() == '2') {
      $(".register-content").show();
    }
  });

});
$(document).ready(function () {
  $(".register-content").hide();
  $("#way").on('change', function () {
    $(".register-content").hide();
    if ($(this).val() == '2') {
      $(".register-content").show();
    }
  });

});
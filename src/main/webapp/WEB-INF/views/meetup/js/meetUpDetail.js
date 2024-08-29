$(document).ready(function () {
  $(".meetUpmodal").hide();
  $(".schedule").click(function () {
    $(".meetUpmodal").trigger("click");
  });
});
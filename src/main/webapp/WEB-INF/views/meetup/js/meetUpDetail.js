$(document).ready(function () {
  $(".meetUpmodal").hide();

  $(".schedule").click(function () {
    $(".meetUpmodal").trigger("click");
  });

  $(".posts").click(function () {
    location.href="./postDetail.html"
  });

});
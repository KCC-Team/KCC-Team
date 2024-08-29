$(document).ready(function () {
  // header 불러오기
  $("#header1").load(
    "/src/main/webapp/WEB-INF/views/common/header.html",
    function () {
      $(document).trigger("headerLoaded");
    }
  );

  // footer 불러오기
  $("#footer1").load(
    "/src/main/webapp/WEB-INF/views/common/footer.html",
    function () {}
  );
});

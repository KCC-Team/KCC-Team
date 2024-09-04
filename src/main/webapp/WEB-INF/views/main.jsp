<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PET KCC</title>

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../../resources/common/common.js" type="text/javascript"></script>
    <link rel="icon" href="../../resources/images/spring-logo.ico" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>

    <link rel="stylesheet" type="text/css" href="../../resources/common/common.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/css/main.css" />
  </head>
  <body>

    <%@ include file="../../resources/common/header.jsp" %>

    <section class="d-flex flex-column align-items-center min-vh-100">
      <div class="container custom-container">
        <section class="row search-bar">
          <div class="row">
            <div class="col-md-6 offset-md-3">

              <form id="searchForm" action="/search" method="get">
              <div class="input-group mb-1 search-bar">
                  <button type="submit" class="input-group-text">
                    <img src="../../resources/images/zoom-icon.png" alt="Search Icon" style="width: 30px; height: 30px"/>
                  </button>
                  <input type="text" class="form-control" name="title" placeholder="찾고 싶은 모임명을 검색하세요"/>
              </div>
              </form>

            </div>
          </div>
        </section>

        <div class="mb-4" id="meetup">모임</div>

        <section class="container">

          <div class="row">

            <c:forEach items="${list}" var="meetup">
              <div class="col-lg-4 col-md-6 card cus_card-card">
                <div class="card-body">
                  <h5 class="card-title cus_card-title"><c:out value="${meetup.category}" /></h5>
                  <br />
                  <h6 class="card-subtitle mb-2 text-muted cus_card-subtitle">
                    <c:out value="${meetup.title}" />
                  </h6>
                  <p class="card-text cus_card-text mb-5">
                    <c:out value="${meetup.intro}" />

                  </p>
                  <br />
                  <a href="/meetups/<c:out value="${meetup.meet_up_id}" />" class="btn cus_card-btn">참여하기</a>
                </div>
              </div>
            </c:forEach>

          <br />

            <div class="pull-right d-flex justify-content-center"
                 aria-label="Page navigation example">
              <ul class="pagination">

                <c:if test="${pageMaker.prev}">
                  <li class="paginate_button page-item prev">
                    <a href="${pageMaker.startPage -1}" class="page-link">이전</a>
                  </li>
                </c:if>

                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                  <li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
                    <a href="${num}" class="page-link">${num}</a>
                  </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                  <li class="paginate_button page-item next">
                    <a href="${pageMaker.endPage + 1 }" class="page-link">다음</a>
                  </li>
                </c:if>

              </ul>
            </div>

            <form id='actionForm' action="/" method='get'>
              <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
              <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
              <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
              <input type='hidden' name='title' value=''>
            </form>

        </section>
      </div>
    </section>

    <%@ include file="../../resources/common/footer.jsp" %>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script src="../../resources/js/main.js"></script>
  </body>
</html>

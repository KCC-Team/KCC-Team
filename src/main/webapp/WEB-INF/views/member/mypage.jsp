<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PET KCC</title>

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../../../resources/common/common.js" type="text/javascript"></script>

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

    <link rel="stylesheet" type="text/css" href="../../../resources/common/common.css"/>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/mypage.css">
</head>

<body>

    <header>
        <%@ include file="../../../resources/common/header.jsp" %>
    </header>

    <div class="container">


      <div class="section">
          <div class="section-header">
              <span>내 모임</span>
          </div>

        <c:forEach items="${meetupList}" var="meetup" begin="0" end="4">
          <div class="item">
              <span class="label">
                  <a href="/meetups/<c:out value="${meetup.meet_up_id}" />"><c:out value="${meetup.title}" /></a>
              </span>
          </div>
        </c:forEach>

      </div>
  
      <div class="section">
          <div class="section-header">
              <span>내 일정 조회</span>
          </div>
            <c:forEach items="${scheduleList}" var="schedule" begin="0" end="4">
              <table class="schedule">
                  <tr>
                      <td><c:out value="${schedule.scheduleTitle}" /></td>
                      <td><c:out value="${schedule.scheduleTime}" /></td>
                  </tr>
              </table>
            </c:forEach>
      </div>

      <div class="section">
          <div class="section-header">
              <span>승인 목록</span>
          </div>
          <div class="item">
              <span class="label">
                  <a href="#">승인목록1</a>
              </span>
          </div>
          <div class="item">
              <span class="label">
                  <a href="#">승인목록2</a>
              </span>
          </div>
      </div>
  
  </div>

  <div class="buttons">
      <a href="/members/memberModify">회원수정</a>
      <form id="deleteForm" action="/members/delete" method="post">
          <sec:authorize access="isAuthenticated()">
              <input type="hidden" name="username" value="<sec:authentication property="principal.username"/>">
          </sec:authorize>
          <button type="submit" class="delete-member">회원 탈퇴</button>
      </form>
  </div>

    <div id="result-container" data-result="${result}"></div>

    <footer>
        <%@ include file="../../../resources/common/footer.jsp" %>
    </footer>

    <script type="text/javascript" src="../../../resources/js/mypage.js"></script>
</body>
</html>

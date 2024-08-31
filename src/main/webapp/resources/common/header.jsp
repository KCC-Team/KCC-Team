<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- header start -->
<section class="fixed-top">
  <header>
    <section class="header-user">
      <a href="/">
        <img
          class="img-logo m-3"
          src="../../resources/images/logo.png"
          style="width: 130px; height: 130px"
          alt="logo"
        />
      </a>

      <nav class="user-menu">
        <a href="/">홈</a>

        <sec:authorize access="isAnonymous()">
          <a href="/members/loginForm">로그인</a>
        </sec:authorize>

        <sec:authorize access="isAnonymous()">
          <a href="/members/joinForm">회원가입</a>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
           <form method="POST" action="/logout" class="logout_form">
              <button type="submit" class="logout_btn">로그아웃</button>
           </form>
          <a href="/members/mypage">마이페이지</a>
        </sec:authorize>

        <a href="/meetup/meetupRegister" class="btn main-btn">모임 생성</a>
      </nav>

    </section>
    <!-- Dropdown Menu -->
    <section class="menu-dropdown" id="menuDropdown">
      <!-- Dynamic content will be loaded here based on hover -->
    </section>
    <div class="border-divider"></div>
  </header>
</section>
<!-- header end -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="../../../resources/common/common.js" type="text/javascript"></script>
  <link rel="icon" href="../../../resources/images/spring-logo.ico" />
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

  <link rel="stylesheet" type="text/css" href="../../../resources/common/common.css" />
  <link rel="stylesheet" type="text/css" href="../../../resources/css/joinForm.css" />

  <title>Document</title>
</head>
<body>

<%@ include file="../../../resources/common/header.jsp" %>

<div class="signup-container">
  <h2 class="form-title">회원 정보 입력</h2>
  <form action="#" method="post">
      <div class="form-group">
          <label for="username">아이디</label>
          <input type="text" id="username" name="username"  placeholder="아이디">
          <a href="#" class="duplicate-check">중복확인</a>
      </div>
      <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" id="password" name="password"  placeholder="비밀번호">
      </div> 
      <div class="form-group">
          <label for="password-confirm">비밀번호확인</label>
          <input type="password" id="password-confirm" name="password-confirm" placeholder="비밀번호 확인">
      </div>
      <div class="form-group">
          <label for="nickname">이름</label>
          <input type="text" id="nickname" name="nickname" placeholder="이름">
      </div>
      <div class="form-group">
          <label for="gender">성별</label>
          <input type="text" id="gender" name="gender" placeholder="성별">
      </div>
      <div class="form-group">
          <label for="birthdate">생년월일</label>
          <input type="text" id="birthdate" name="birthdate" placeholder="생년월일">
      </div>
      <div class="form-group">
          <label for="email">이메일</label>
          <input type="text" id="email" name="email" placeholder="이메일">
      </div>
      <div class="form-group">
          <label for="tel">휴대폰</label>
          <input type="text" id="tel" name="tel" placeholder="휴대폰">
      </div>
      <div class="form-group">
          <label for="address">주소</label>
          <input type="text" id="address" name="address" placeholder="주소">
      </div>
      <button type="submit" class="submit-button">가입하기</button>
  </form>
</div>

<footer>
    <%@ include file="../../../resources/common/footer.jsp" %>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>
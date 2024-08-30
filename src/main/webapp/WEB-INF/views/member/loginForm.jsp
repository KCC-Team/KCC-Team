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
  <link rel="stylesheet" type="text/css" href="../../../resources/css/login.css" />

  <title>Document</title>
</head>
<body>

<%@ include file="../../../resources/common/header.jsp" %>

<div class="d-flex container text-center">
  <div class="justify-content-center">
    <div class="col-md-6">
      <div class="image-container mb-4">
        <img src="../../../resources/images/login_pet.png" alt="Login Image">
      </div>  
      <div class="login-container">
        <form action="#" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">아이디</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="아이디">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
            </div>
            <button type="submit" class="btn login-button w-100">로그인</button>
            <a href="/joinForm" class="btn register-button w-100">회원가입</a>
        </form>
      </div>
    </div>
  </div>
</div>

<%@ include file="../../../resources/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>
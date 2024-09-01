<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

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
    <link rel="stylesheet" type="text/css" href="../../../resources/css/meetupRegister.css">
</head>

<body>

    <header>
        <%@ include file="../../../resources/common/header.jsp" %>
    </header>

    <main>
        <div class="signup-container">
            <h2 class="form-title">모임 등록</h2>

            <form action="#" method="post" encType="multipart/form-data">
                <div class="form-group">
                    <label for="title">모임명</label>
                    <input type="text" id="title" name="title" placeholder="모임명을 입력해주세요.">
                </div>
                <div class="form-group">
                    <label for="intro">모임 소개 설명</label>
                    <textarea id="intro" name="intro" placeholder="소개글을 입력해주세요."></textarea>
                </div>
                <div class="form-group">
                    <label for="way">가입 방법</label>
                    <select id="way" name="way" >
                        <option value="1" selected>바로 가입</option>
                        <option value="2">승인 후 가입</option>
                    </select>
                </div>
                <div class="form-group register-content">
                    <label for="content">가입 질문</label>
                    <textarea id="content" name="content" placeholder="가입 질문을 입력해주세요."></textarea>
                </div>
                <div class="form-group">
                    <label for="person">최대 인원</label>
                    <select id="person" name="person" >
                        <option value="1">1명</option>
                        <option value="2">2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="category">카테고리</label>
                    <select id="category" name="category" >
                        <option value="소형견">소형견</option>
                        <option value="중형견">중형견</option>
                        <option value="대형견">대형견</option>
                        <option value="일상">일상</option>
                        <option value="취미">취미</option>
                        <option value="정보">정보</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="file_original_name">대표 사진</label>
                    <input type="file" id="file_original_name" name="file_original_name">
                </div>
                <button type="submit" class="submit-button">등록</button>
            </form>

        </div>
    </main>

    <footer>
        <%@ include file="../../../resources/common/footer.jsp" %>
    </footer>

    <script type="text/javascript" src="../../../resources/js/meetupRegister.js"></script>
</body>
</html>

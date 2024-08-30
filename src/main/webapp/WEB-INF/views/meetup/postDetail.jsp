<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PET KCC</title>

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
    <link
      rel="stylesheet"
      type="text/css"
      href="../../../resources/css/postDetail.css"
    />
  </head>
  <body>

  <header>
    <%@ include file="../../../resources/common/header.jsp" %>
  </header>

    <div style="height: 800px; margin-top: 200px" class="container">
      <section class="post-container">
        <div class="post-header">
          <img src="profile-image-url" alt="프로필 사진" class="profile-img" />
          <div class="text-container">
            <h2 class="fw-bold">이수호</h2>
            <p class="post-date">2024.08.28</p>
          </div>
        </div>
        <div class="post-body">
          <div class="post">
            <h3>초보 반려인을 위한 반려견 기본 훈련 팁!</h3>
            <p>
              안녕하세요, 강아지를 키우기 시작한 지 얼마 안 된 초보
              반려인입니다! 🐶
            </p>
            <p>
              저처럼 반려견 훈련에 어려움을 느끼는 분들을 위해 몇 가지 기본 훈련
              팁을 공유해보려고 해요.
            </p>
            <ul>
              <li>
                <strong>이름 부르기 훈련:</strong> 반려견의 이름을 부르면서 항상
                긍정적인 경험을 연결시켜주세요.
              </li>
              <li>
                <strong
                  >간식이나 칭찬을 통해 이름이 좋은 의미로 다가오도록 하는 게
                  중요해요.</strong
                >
              </li>
              <li>
                <strong>앉아 훈련:</strong> 손에 간식을 들고 반려견의 코 앞에서
                위로 천천히 올리면 자연스럽게 앉는 자세가 나와요.
              </li>
              <li>
                <strong
                  >그때 '앉아'라는 명령어를 반복하면서 훈련해보세요.</strong
                >
              </li>
              <li>
                <strong>배변 훈련:</strong> 정해진 장소에 배변을 유도하기
                위해서는 규칙적인 산책과 칭찬이 필수입니다.
              </li>
              <li>
                <strong
                  >성공했을 때는 꼭 칭찬과 간식으로 보상을 주시는 것, 잊지
                  마세요!</strong
                >
              </li>
            </ul>
            <p>
              여러분의 반려견 훈련 꿀팁도 공유해 주세요! 함께 배워가면 좋을 것
              같아요. 😊
            </p>
          </div>
        </div>
        <div class="comment-title m-2">댓글</div>
        <div class="input-group mb-1 search-bar">
          <input
            type="text"
            class="form-control"
            placeholder="댓글을 입력하세요"
          />
          <span class="post-footer">
            <button>보내기</button>
          </span>
        </div>
      </section>
    </div>

    <footer>
      <%@ include file="../../../resources/common/footer.jsp" %>
    </footer>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
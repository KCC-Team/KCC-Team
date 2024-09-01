<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
    <style>
      .comment-box {
        margin-bottom: 15px;
        padding-left: 0;
      }
      .reply-box {
        margin-left: 40px;
        margin-top: 10px;
      }
      /* 동적 들여쓰기를 위한 기본 클래스 */
      .comment-indent {
        padding-left: calc(30px * var(--dept-level)); /* dept 수준에 따라 들여쓰기 조절 */
      }

      .reply-container {
        max-width: 800px;
      }

      .reply-title {
        font-size: 25px;
        font-weight: bold;
      }
    .j-reply-name-date-box{
      display: flex;
      flex-direction: row;
      justify-content: space-between;
    }
    .j-reply-content-box{
      display: flex;
      justify-content: space-between;
      white-space: normal;
    }
    .j-reply-content{
      width: 70%;
      white-space: normal;
      word-break: normal;
    }
    .j-reply-button{
    }
      .hidden {
        display: none; /* 요소를 숨깁니다 */
      }
    </style>
  </head>
  <body>

  <header>
    <%@ include file="../../../resources/common/header.jsp" %>
  </header>

    <div style="height: 500px; margin-top: 200px" class="container">
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
      </section>
    </div>

  <div class="container reply-container">
    <span class="reply-title">댓글</span>
    <div class="comment-container">
      <div class="comment-box">
        <c:forEach var="reply" items="${replies}">
          <div class="comment-box comment-indent"
               style="--dept-level: ${reply.dept};">
            <div class="p-2 bg-light">
              <div class="j-reply-name-date-box">
                <span class="hidden">${reply.replyId}</span>
                <strong>${reply.writer.nickname}</strong>
                <small>${reply.createdAt}</small>
              </div>
              <div class="j-reply-content-box">
                <div class="j-reply-content">
                ${reply.content}
              </div>
                <div class="j-reply-button">
                  <input type="button" value="댓글달기">
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
        <textarea id="new-comment" class="form-control jw-add-comment" rows="3" placeholder="댓글을 입력하세요..."></textarea>
        <button id="add-comment" class="btn btn-primary mt-2 jw-add-button">댓글 추가</button>
      </div>
    </div>
  </div>

    <footer>
      <%@ include file="../../../resources/common/footer.jsp" %>
    </footer>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous">

    </script>
    <script>


      $(document).ready(function () {
        $('#add-comment').on('click', function () {
          let commentText = $(this).prev('#new-comment').val();
          console.log(commentText);
          if (commentText) {
            addComment(commentText);
            $('#new-comment').val('');
          }
        });
      });

      function addComment(commentText, parentId = null) {
        const urlParams = new URLSearchParams(window.location.search);
        const postId = urlParams.get('post');  // 'post' 쿼리 파라미터의 값을 가져옴

        $.ajax({
          url: '/reply',
          method: 'POST',
          data: JSON.stringify({
            postId : postId,
            content: commentText,
            memberId: 9,
            parentId: parentId
          }),
          contentType: 'application/json',

        }).always(function () {
          location.reload();
        });
      }

      $('.comment-box').on('click','.j-reply-button > input[type=button]',function(e){
        e.stopPropagation();

        // 해당 버튼이 속한 부모 요소를 찾습니다.
        let parentElement = $(this).closest('.comment-box.comment-indent');

        // 이미 댓글 입력란이 존재하는지 확인합니다.
        if (parentElement.find('.jw-add-comment').length > 0) {
          // 존재하면 제거합니다.
          parentElement.find('.jw-add-comment').remove();
          parentElement.find('.jw-add-button').remove();
        } else {
          // 존재하지 않으면 추가합니다.
          let html = `<textarea id="new-new-comment" class="form-control jw-add-comment" rows="3" placeholder="댓글을 입력하세요..."></textarea>
                    <button id="add-new-comment" class="btn btn-primary mt-2 jw-add-button">댓글 추가</button>`;
          parentElement.append(html);
        }
      });

      $('.comment-box').on('click', '.jw-add-button', function(e) {
        e.stopPropagation();
        //alert('ttttttttttttt');
        let commentText = $(this).prev('#new-new-comment').val();
        console.log(commentText);
        console.log("parent");
        let parentId = $(this).closest('.comment-box').find('.hidden').text();
        if (commentText) {
          addComment(commentText, parentId);
          $(this).prev('#new-new-comment').remove(); // 댓글 추가 후 입력란 제거
          $(this).prev('#add-new-comment').remove(); // 댓글 추가 후 버튼 제거
        }
      });

    </script>
  </body>
</html>

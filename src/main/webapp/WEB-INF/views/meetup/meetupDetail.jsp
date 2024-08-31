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
    <link rel="stylesheet" type="text/css" href="../../../resources/css/meetupDetail.css">
</head>

<body>

    <header>
        <%@ include file="../../../resources/common/header.jsp" %>
    </header>

    <section class="group-info">
      <span class="group-details">
          <span class="meet-leader-img"><img src="#" alt="사진"></span>
          <h1>모임 이름 <span class="meet-name">대형견</span></h1>
      </span>
      <div class="meet-member">
        <p>
            <span class="total-board">총게시글</span>
            <span class="member-count">모임인원</span>
        </p>
        <span class="meet-total-count">13</span>
        <span class="meet-member-count">5</span>
      </div>
  </section>

    <main>
        <section class="post-section">
            <form class="post-input">
                <textarea placeholder="게시글을 입력하세요" maxlength="500"></textarea>
                <div class="post-actions">
                    <span class="char-count">0 / 500</span>
                    <button type="submit" class="post-button">게시</button>
                </div>
            </form>

            <div class="posts">
                <span class="profile-group">
                    <span class="profile-photo">
                        <img src="#" alt="이미지">
                    </span>
                    <span class="profile-info">
                        <span class="author">이수호</span>
                        <span class="date">2024.08.28</span>
                    </span>
                </span>
                <span class="post">
                    <p class="post-text">초보 반려인을 위한 반려견 기본 훈련 팁! 내용: 안녕하세요, 강아지를 키우기 시작한 지 얼마 안 된 초보 반려인입니다...</p>
                </span>
            </div>

            <div class="posts">
                <span class="profile-group">
                    <span class="profile-photo">
                        <img src="#" alt="이미지">
                    </span>
                    <span class="profile-info">
                        <span class="author">이수호</span>
                        <span class="date">2024.08.28</span>
                    </span>
                </span>
                <span class="post">
                    <p class="post-text">초보 반려인을 위한 반려견 기본 훈련 팁! 내용: 안녕하세요, 강아지를 키우기 시작한 지 얼마 안 된 초보 반려인입니다...</p>
                </span>
            </div>

            <div class="pagination">
                <span>이전</span>
                <span class="active">1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>
                <span>다음</span>
            </div>

        </section>

        <aside class="schedule-sec">
            <span class="schedule-header">
                <span class="meet-date">일정</span>
                <a href="#">일정 생성</a>
            </span>

            <div id="scheduleList"></div>
            <div class="pagination">
                <span>이전</span>
                <span class="active">1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>
                <span>다음</span>
            </div>
        </aside>
    </main>

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary meetUpmodal" data-bs-toggle="modal"
        data-bs-target="#meetUpModal">
        Launch demo modal
    </button>

    <!-- 모임일정 Modal -->
    <div class="modal fade" id="meetUpModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                🌳 다음 주 토요일! 흑석동 반려견 모임 공지 🌳
                <br>
                <br>
                안녕하세요, 귀여운 강아지 동호회 회원 여러분!
                <br>
                <br>
                다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다.
                <br>
                <br>
                이번 모임은 한강변에서 산책과 놀이를 주제로 진행하려고 해요.
                <br>
                <br>
                날씨도 좋을 것 같으니 반려견들과 신나게 놀 수 있는 시간을 가져보면 좋겠습니다. 😊
                <br>
                <br>
                일정: 2024.09.09 12시 ~ 17시
                <br>
                제한인원: 4인
                <br>
                마감 기한: 2024.09.07 15:30
                <br>
                <br>
                모임장: 이수호
                <br><br>
                <span class="meetup-profile">
                    <img src="#" alt="이미지">
                </span>
                <span class="meetup-profile">
                    <img src="#" alt="이미지">
                </span>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-primary btn-meetup">참가 <span>2 / 4</span></button>
            </div>
        </div>
        </div>
    </div>

    <footer>
        <%@ include file="../../../resources/common/footer.jsp" %>
    </footer>

    <script type="text/javascript" src="../../../resources/js/meetupDetail.js"></script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
    <style>
        .hidden {
            display: none;
        }
    </style>
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
        <span class="meet-total-count">${totalPosts}</span>
        <span class="meet-member-count">${totalMembers}</span>
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

        <c:forEach var="post" items="${posts}">
            <div class="posts">
                    <span class="profile-group">
                        <span class="profile-photo">
                            <img src="#" alt="이미지">
                        </span>
                        <span class="profile-info">
                            <span id="y-postId" class=".hidden">${post.postId}</span>
                            <span class="author">${post.member.nickname}</span>
                            <span class="date">${post.createdAt}</span>
                        </span>
                    </span>
                <span class="post">
                        <p class="post-text">${post.title}</p><br>
                        <p class="post-text">${post.content}</p>
                    </span>
            </div>
        </c:forEach>

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

<!-- 모임 일정 생성 Modal -->
<div class="modal fade" id="createMeetUpModal" tabindex="-1" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header justify-content-center">
                <h5 class="modal-title" id="createModalLabel">일정 만들기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="scheduleVO" action="/schedules?meetupId=${meetupId}" method="post">
                    <div class="mb-3">
                        <label for="scheduleTitle" class="form-label">제목</label>
                        <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle" placeholder="일정 제목을 입력하세요" />
                    </div>
                    <div class="mb-3">
                        <label for="scheduleDescription" class="form-label">내용</label>
                        <textarea class="form-control" id="scheduleDescription" name="scheduleDescription" rows="3" placeholder="일정 내용을 입력하세요"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="location" class="form-label">위치</label>
                        <textarea class="form-control" id="location" name="location" rows="3" placeholder="위치를 입력하세요"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="scheduleTime" class="form-label">일정</label>
                        <input type="text" class="form-control" id="scheduleTime" name="scheduleTime" placeholder="예: 2024-09-15 14:00" />
                    </div>
                    <div class="mb-3">
                        <label for="participantLimit" class="form-label">제한인원</label>
                        <input type="number" class="form-control" id="participantLimit" name="participantLimit" placeholder="예: 30" />
                    </div>
                    <div class="mb-3">
                        <label for="deadline" class="form-label">마감일</label>
                        <input type="text" class="form-control" id="deadline" name="deadline" placeholder="예: 2024-09-15 14:00" />
                    </div>
                    <button type="submit" class="btn" style="background-color: #80d69b">만들기</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 모임일정 Modal -->
<div class="modal fade" id="meetUpModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>🌳 ${schedule.title} 🌳</h4>
                <p>${schedule.content}</p>
                <p>일정: ${schedule.appointment_time}</p>
                <p>제한인원: ${schedule.person}인</p>
                <p>마감 기한: ${schedule.deadline}</p>
                <p>모임장: ${schedule.leader}</p>
                <!-- 예시 이미지 -->
                <span class="meetup-profile">
                    <img src="#" alt="이미지"> <!-- 실제 이미지 경로 필요 -->
                </span>
                <span class="meetup-profile">
                    <img src="#" alt="이미지"> <!-- 실제 이미지 경로 필요 -->
                </span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger delete-btn">삭제</button>
                <button type="button" class="btn btn-primary btn-meetup apply-btn">참가 <span class="accept_count"></span></button>
            </div>
        </div>
    </div>
</div>

<footer>
    <%@ include file="../../../resources/common/footer.jsp" %>
</footer>

<script type="text/javascript" src="../../../resources/js/meetupDetail.js"></script>
<script>
    $(document).ready(function() {
        $(document).on('click', '.posts', function() {
            console.log("asd");
            const postId = $("#y-postId").text();
            console.log(postId);

            $.ajax({
                url: `/posts/${postId}`,
                type: 'GET',
                success: function(data) {
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        });
    });
</script>
</body>
</html>
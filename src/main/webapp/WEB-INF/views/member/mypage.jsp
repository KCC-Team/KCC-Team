<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="../../../resources/common/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/mypage.css">
</head>

<body>

	<header>
		<%@ include file="../../../resources/common/header.jsp"%>
	</header>

	<div class="container">

		<div class="section">
			<div class="section-header">
				<span>내 모임</span>
			</div>

			<c:if test="${empty meetupList}">
				<div class="item">
					<p class="label">참여중인 모임이 없습니다.</p>
				</div>
			</c:if>

			<c:forEach items="${meetupList}" var="meetup" begin="0" end="4">
				<div class="item">
					<span class="label">
						<a href="/meetups/<c:out value="${meetup.meet_up_id}" />">
							<c:out value="${meetup.title}" />
						</a>
					</span>
				</div>
			</c:forEach>

		</div>

		<div class="section">
			<div class="section-header">
				<span>내 일정 조회</span>
			</div>

			<c:if test="${empty scheduleList}">
				<div class="item">
					<p class="label">예정된 일정이 없습니다.</p>
				</div>
			</c:if>

			<c:forEach items="${scheduleList}" var="schedule" begin="0" end="4">
				<table class="schedule">
					<tr>
						<td><c:out value="${schedule.scheduleTitle}" /></td>
						<td><c:out value="${schedule.scheduleTime}" /></td>
					</tr>
				</table>
			</c:forEach>
		</div>


		<!-- 승인 대기 목록 섹션 -->
		<div class="section mb-5">
			<div class="section-header">
				<span>승인 대기 목록</span>
			</div>

			<c:if test="${empty answers}">
				<div class="item">
					<p class="label">대기중인 승인 목록이 없습니다.</p>
				</div>
			</c:if>

			<c:if test="${not empty answers}">
				<c:forEach items="${answers}" var="answer">
					<c:if test="${answer != null}">
						<div class="card mb-4">
							<div class="card-header">
								<h3>모임번호 ${answer.meetUpId} - ${answer.meetUpTitle}</h3>
							</div>
							<div class="card-body">
								<c:forEach items="${answer.answerDetails}" var="detail"
									varStatus="status">
									<input type="hidden" name="member" value="${detail.memberId}" />

									<c:if
										test="${status.first or detail.nickname != previousNickname}">
										<c:set var="previousNickname" value="${detail.nickname}" />
										<c:if test="${!status.first}">
											<div class="border-top my-3"></div>
										</c:if>
										<div
											style="display: flex; justify-content: space-between; white-space: normal;">
											<h4
												style="margin-top: 11px; font-size: 17px; font-weight: bold;">${detail.nickname}</h4>
											<button type="button" class="btn btn-success approve-btn"
												data-member-id="${detail.memberId}"
												data-meetup-id="${answer.meetUpId}">승인</button>
										</div>
									</c:if>

									<div class="question-answer-item"
										data-member-id="${detail.memberId}"
										data-question-id="${detail.questionId}">
										<p>
											<strong>질문:</strong> ${detail.questionContent}
										</p>
										<p>
											<strong>답변:</strong> ${detail.answer}
										</p>
									</div>
								</c:forEach>
							</div>
						</div>
						<hr class="my-4" />
					</c:if>
				</c:forEach>
			</c:if>

		</div>


		<div class="buttons">
			<a href="/members/memberModify" class="btn-modify">회원수정</a>
			<form id="deleteForm" action="/members/delete" method="post"
				class="d-inline-block">
				<sec:authorize access="isAuthenticated()">
					<input type="hidden" name="username"
						value="<sec:authentication property="principal.username"/>">
				</sec:authorize>
				<button type="submit" class="btn-delete">회원 탈퇴</button>
			</form>
		</div>

		<div id="result-container" data-result="${result}"></div>
	</div>
	<footer>
		<%@ include file="../../../resources/common/footer.jsp"%>
	</footer>

	<script type="text/javascript" src="../../../resources/js/mypage.js"></script>
	<script>
		$(document).ready(
				function() {
					$('.approve-btn').click(
							function() {
								const memberId = $(this).data('member-id');
								const meetUpId = $(this).data('meetup-id');
								console.log(memberId);
								console.log(meetUpId);

								let url = "/meetups/" + meetUpId + "/members/"
										+ memberId + "/approve";

								$.ajax({
									url : "/meetups/" + meetUpId + "/members/"
											+ memberId + "/approve", // 서버 URL
									type : 'POST',
									success : function(response) {
										alert('승인되었습니다!');
										location.reload();
									},
									error : function(xhr, status, error) {
										alert('승인 처리 중 오류가 발생했습니다.');
									}
								});
							});
				});
	</script>
</body>
</html>
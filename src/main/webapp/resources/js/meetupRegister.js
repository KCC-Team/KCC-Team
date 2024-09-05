$(function() {
	function getErrorParameter() {
		let search = window.location.search;
		let params = new URLSearchParams(search);
		return params.get('loginDenied');
	}
	let loginDenied = getErrorParameter();
	if (loginDenied) {
		alert(decodeURIComponent(loginDenied));
	}

	$(".register-content").hide();
	$("#way").on('change', function() {
		$(".register-content").hide();
		if ($(this).val() == 'false') {
			$(".register-content").show();
		}
	});

	// 초기 인덱스 값 설정
	let questionIndex = 1;

	// 이벤트 위임을 사용하여 동적으로 추가된 요소에도 적용
	$(document).on("click", ".question-plus", function(e) {
		if (questionIndex > 2) {
			return false;
		}

		// 질문 번호 증가
		questionIndex++;

		// 기존 요소 복제
		let newQuestion = $('.register-content').last().clone();

		// 새로운 요소에 고유한 번호 추가
		newQuestion.attr('data-index', questionIndex);
		newQuestion.find('label').attr('for', 'content' + questionIndex).text('가입 질문 ' + questionIndex);
		newQuestion.find('textarea').attr('id', 'content' + questionIndex).val('');
		newQuestion.find('textarea').attr('name', 'contentList[]').val('');  // name을 contentList[]로 수정


		// 복제한 요소를 기존 요소 뒤에 삽입
		$('.register-content').last().after(newQuestion);
	});

});
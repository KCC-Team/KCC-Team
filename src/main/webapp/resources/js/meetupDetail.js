$(function() {
  $(".meetUpmodal").hide();

  $("body").on("click", ".schedule", function() {
    $(".meetUpmodal").trigger("click");
  });

  $(".posts").click(function () {
    location.href="/meetups/postDetail";
  });

  loadSchedules(1);

  $('.view-meetup-details').on('click', function() {
    const meetupId = $(this).data('meetup-id');  // 버튼에서 data-meetup-id 속성을 읽어옴
    loadMeetupDetails(meetupId);
  });
});

function loadSchedules(page) {
  const pathArray = window.location.pathname.split('/');
  const meetupId = pathArray[2];

  $.ajax({
    url: `/meetups/${meetupId}/schedules?page=${page}`,
    type: 'GET',
    success: function(response) {
      updateScheduleList(response.responses);
      updateSchedulePagination(response.currentPage, response.startPage, response.endPage);
    },
    error: function(errorResponse) {
      alert(errorResponse.responseJSON.messages.error);
    }
  });
}

function updateScheduleList(schedules) {
  let html = schedules.map(schedule => `
        <div class="schedule">
            <h4><strong>🌳 ${schedule.title} 🌳</strong></h4>
            <p>${schedule.content}</p>
            <br>
            <p>일정: ${formatDate(schedule.appointment_time)}</p>
            <p>제한 인원: ${schedule.person}인</p>
        </div>
    `).join('');
  $('#scheduleList').html(html);
}

function updateSchedulePagination(currentPage, startPage, endPage) {
  let html = `<span onclick="loadSchedules(${currentPage - 1})">이전</span>`;
  for (let i = startPage; i <= endPage; i++) {
    html += `<span class="${i === currentPage ? 'active' : ''}" onclick="loadSchedules(${i})">${i}</span>`;
  }
  html += `<span onclick="loadSchedules(${currentPage + 1})">다음</span>`;
  $('.schedule-sec .pagination').html(html);
}

function loadMeetupDetails(meetupId, scheduleId) {
  $.ajax({
    url: `/meetups/${meetupId}/schedules/${scheduleId}`,
    type: 'GET',
    success: function(response) {
      updateMeetupModal(response);
      $('#meetUpModal').modal('show');
    },
    error: function(xhr) {
      console.error('Failed to load meetup details:', xhr);
    }
  });
}

function updateMeetupModal(meetup) {
  // 모달의 내용을 업데이트
  $('.modal-body').html(`
        <h4>🌳 ${meetup.title} 🌳</h4>
        <p>${meetup.description}</p>
        <p>일정: ${meetup.date} ${meetup.startTime} ~ ${meetup.endTime}</p>
        <p>제한인원: ${meetup.limit}인</p>
        <p>마감 기한: ${meetup.deadline}</p>
        <p>모임장: ${meetup.host}</p>
        <div class="meetup-profiles">${meetup.participants.map(p => `<img src="${p.image}" alt="이미지">`).join('')}</div>
    `);
  $('.modal-footer').html(`<button type="button" class="btn btn-primary btn-meetup">참가 <span>${meetup.registered} / ${meetup.limit}</span></button>`);
}

function formatDate(dateString) {
  const date = new Date(dateString);
  const formatter = new Intl.DateTimeFormat('ko-KR', {
    year: 'numeric', month: 'long', day: 'numeric',
    hour: 'numeric', minute: 'numeric', hour12: false
  });
  return formatter.format(date);
}
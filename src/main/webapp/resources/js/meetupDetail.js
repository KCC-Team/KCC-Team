$(function() {
  $(".meetUpmodal").hide();

  $("body").on("click", ".schedule", function() {
    // $(".meetUpmodal").trigger("click");
    let meetupId = window.location.pathname.split('/')[2];
    loadMeetupDetails(meetupId, $(this).find('input[type="hidden"]').val());
  });

  $(".posts").click(function () {
    location.href="/meetups/postDetail";
  });

  loadSchedules(1);
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
            <input type="hidden" value="${schedule.schedule_id}">
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
      $('#meetUpModal').modal('show');
    },
    error: function(xhr) {
      console.error('Failed to load meetup details:', xhr);
    }
  });
}

function formatDate(dateString) {
  const date = new Date(dateString);
  const formatter = new Intl.DateTimeFormat('ko-KR', {
    year: 'numeric', month: 'long', day: 'numeric',
    hour: 'numeric', minute: 'numeric', hour12: false
  });
  return formatter.format(date);
}
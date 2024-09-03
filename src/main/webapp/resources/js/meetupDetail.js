$(function() {
    $(".meetUpmodal").hide();

    $("body")
        .on("click", ".schedule", function() {
            let meetupId = window.location.pathname.split('/')[2];
            loadMeetupDetails(meetupId, $(this).find('input[type="hidden"]').val());
        })
        .on("click", ".apply-btn", function() {
            applySchedule();
        })
        .on("click", ".delete-btn", function() {
            deleteSchedule();
        });
});

function loadSchedules(page) {
    const pathArray = window.location.pathname.split('/');
    const meetupId = pathArray[2];

    $.ajax({
        url: `/schedules?meetupId=${meetupId}&page=${page}`,
        type: 'get',
        success: function(response) {
            console.log(response);
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

function deleteSchedule() {
    const meetupId = window.location.pathname.split('/')[2];
    const scheduleId = $('.schedule_id').val();

    $.ajax({
        url: `/schedules/${scheduleId}`,
        type: 'post',
        success: function(response) {
            $('#meetUpModal').modal('hide');
            location.href = `/meetups/${meetupId}`;
        },
        error: function(xhr) {
            console.error('Failed to delete schedule:', xhr);
        }
    });
}

function loadMeetupDetails(meetupId, scheduleId) {
    $.ajax({
        url: `/schedules/${scheduleId}`,
        type: 'get',
        success: function(response) {
            let appointment_time = formatDate(response.appointment_time);
            let deadline = formatDate(response.deadline);

            $('#meetUpModal .modal-body').html(`
        <h4><strong>${response.title}</strong></h4>
        <br>
        <p>${response.content}</p>
        <br>
        <p>일정: ${appointment_time}</p>
        <p>제한인원: ${response.person}인</p>
        <p>모임장: ${response.leader}</p>
        <br>
        <p>마감일: <strong>${deadline}</strong> 까지</p>
        <input type="hidden" class="schedule_id" value="${scheduleId}">
        `);
            $('.accept_count').html(`
        ${response.accept_count} / ${response.person}
      `);
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

function applySchedule() {
    const meetupId = window.location.pathname.split('/')[2];
    const scheduleId = $('.schedule_id').val();
    $.ajax({
        url: `/schedules/${scheduleId}/participate?meetupId=${meetupId}`,
        type: 'post',
        success: function(response) {
            alert(response);
            location.href = `/meetups/${meetupId}`;
        },
        error: function(xhr, status, error) {
            console.error("Request failed: " + error);
        }
    });
}

// function applyMeetUp() {
//     const meetupId = window.location.pathname.split('/')[2];
//     $.ajax({
//         url: `/meetups/${meetupId}/participate`,
//         type: 'post',
//         success: function(response) {
//             alert(response);
//             location.href = `/meetups/${meetupId}`;
//         },
//         error: function(xhr, status, error) {
//             console.error("Request failed: " + error);
//         }
//     });
// }
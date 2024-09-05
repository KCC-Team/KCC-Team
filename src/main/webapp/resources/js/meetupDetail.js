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

    for (let hour = 0; hour < 24; hour++) {
        let time = (hour < 10 ? '0' + hour : hour) + ':00';
        $('<option>', {
            value: time,
            text: time
        }).appendTo($('#scheduleTime'));
    }

    $('.search').keydown(function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            searchSchedule();
        }
    });

    $('.icon-placeholder').click(function() {
        searchSchedule();
    });

    $('#sortOrder').change(function() {
        filterSchedule($(this).val());
    });

    let apply_btn = document.querySelector("#y-applyButton");

    $('#post_create_form').submit(function() {
        if (apply_btn) {
            alert("모임 참가 후 게시글 작성이 가능합니다.");
            return false;
        }
        let title = $("#title").val();
        let content = $("#content").val();
        if (title == '') {
            alert("게시글 제목을 입력해주세요.");
            return false;
        }
        if (content == '') {
            alert("게시글을 입력해주세요.");
            return false;
        }
        if (apply_btn) {
            alert("모임 참가 후 게시글 작성이 가능합니다.");
            return false;
        }
    });

    $("#content").keyup(function (e){
        let content = $(this).val();
        if (content.length == 0 || content == "") {
            $(".char-count").text('0');
        } else {
            $(".char-count").text(content.length);
        }
        if (content.length > 500) {
            alert("글자수는 500까지 입력 가능합니다.");
            return false;
        }
    });

});

function loadSchedules(search, page) {
    const pathArray = window.location.pathname.split('/');
    const meetupId = pathArray[2];

    let url;
    if (search !== null && search !== undefined) {
        url = `/schedules?meetupId=${meetupId}&keyword=${search}&page=${page}`;
    } else {
        url = `/schedules?meetupId=${meetupId}&page=${page}`;
    }

    $('#scheduleList').fadeOut(100, function() {
        $.ajax({
            url: url,
            type: 'GET',
            success: function(response) {
                updateScheduleList(response.responses);
                $('#scheduleList').fadeIn(100);

                if (response.responses.length === 0) {
                    updateSchedulePagination(search, 1, 1, 1);
                } else {
                    updateSchedulePagination(search, response.currentPage, response.startPage, response.endPage);
                }
            },
            error: function(errorResponse) {
                alert(errorResponse.responseJSON.messages.error);
                $('#scheduleList').fadeIn(100);
            }
        });
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

function updateSchedulePagination(search, currentPage, startPage, endPage) {
    let html;
    if (search !== null && search !== undefined) {
        html = `<span onclick="loadSchedules(${search}, ${currentPage - 1})">이전</span>`;
    } else {
        html = `<span onclick="loadSchedules(null, ${currentPage - 1})">이전</span>`;
    }

    for (let i = startPage; i <= endPage; i++) {
        if (search !== null && search !== undefined) {
            html += `<span class="${i === currentPage ? 'active' : ''}" onclick="loadSchedules(${search}, ${i})">${i}</span>`;
        } else {
            html += `<span class="${i === currentPage ? 'active' : ''}" onclick="loadSchedules(null, ${i})">${i}</span>`;
        }
    }
    if (search !== null && search !== undefined) {
        html += `<span onclick="loadSchedules(${search}, ${currentPage + 1})">다음</span>`;
    } else {
        html += `<span onclick="loadSchedules(null, ${currentPage + 1})">다음</span>`;
    }
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
    const apply_button = document.querySelector("#y-applyButton");

    if (apply_button) {
        alert("모임 참가 승인 후 일정 생성이 가능합니다.");
        return false;
    }

    $.ajax({
        url: `/schedules/${scheduleId}/participate?meetupId=${meetupId}`,
        type: 'post',
        success: function(response) {
            alert(response);
            location.href = `/meetups/${meetupId}`;
        },
        error: function(xhr, status, error) {
            if (xhr.status === 401) {  // 인증되지 않은 경우
                var response = JSON.parse(xhr.responseText);
                alert("로그인이 필요합니다.");
                window.location.href = response.loginUrl;  // 로그인 페이지로 리디렉션
            } else {
                console.error("Error: " + error);
            }
        }
    });
}

function submitSchedule() {
    const meetupId = window.location.pathname.split('/')[2];
    let formData = {
        scheduleTitle: document.getElementById('scheduleTitle').value,
        scheduleDescription: document.getElementById('scheduleDescription').value,
        location: document.getElementById('location').value,
        participantLimit: document.getElementById('participantLimit').value,
        deadline: document.getElementById('deadline').value,
        scheduleDateTime: document.getElementById('scheduleDate').value + ' ' + document.getElementById('scheduleTime').value
    };
    $.ajax({
        type: 'POST',
        url: `/schedules?meetupId=${meetupId}`,
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success: function(response) {
            location.href = `/meetups/${meetupId}`;
        },
        error: function(response) {
            displayValidationErrors(response.responseJSON.errors);
        }
    });
}

function displayValidationErrors(errors) {
    $('.error-message').remove();

    for (const [key, message] of Object.entries(errors)) {
        const inputForm = $(`#${message.field}`);
        inputForm.css('border', '2px solid red');

        if (message.field === 'scheduleDateTime') {
            const inputForm = $(`#scheduleDate`);
            inputForm.css('border', '2px solid red');

            const inputField = $('#scheduleDate');
            $('<div>')
                .addClass('error-message')
                .css('color', 'red')
                .css('font-weight', 'bold')
                .text(message.defaultMessage)
                .insertAfter(inputField);
        }

        const inputField = $('#' + message.field);
        $('<div>')
            .addClass('error-message')
            .css('color', 'red')
            .css('font-weight', 'bold')
            .text(message.defaultMessage)
            .insertAfter(inputField);
    }
}

function searchSchedule() {
    let search = $('.search').val();
    loadSchedules(search, 1);
}

function filterSchedule(type) {
    const pathArray = window.location.pathname.split('/');
    const meetupId = pathArray[2];

    let url;
    if (type !== null && type !== undefined) {
        url = `/schedules?meetupId=${meetupId}&type=${type}&page=1`;
    } else {
        url = `/schedules?meetupId=${meetupId}&page=1`;
    }

    $('#scheduleList').fadeOut(100, function() {
        $.ajax({
            url: url,
            type: 'GET',
            success: function(response) {
                updateScheduleList(response.responses);
                $('#scheduleList').fadeIn(100);

                if (response.responses.length === 0) {
                    updateSchedulePagination(null, 1, 1, 1);
                } else {
                    updateSchedulePagination(null, response.currentPage, response.startPage, response.endPage);
                }
            },
            error: function(errorResponse) {
                alert(errorResponse.responseJSON.messages.error);
                $('#scheduleList').fadeIn(100);
            }
        });
    });
}

function searchSchedule() {
    let search = $('.search').val();
    console.log('search:', search);
    loadSchedules(search, 1);
}

function filterSchedule(type) {
    const pathArray = window.location.pathname.split('/');
    const meetupId = pathArray[2];

    let url;
    if (type !== null && type !== undefined) {
        url = `/schedules?meetupId=${meetupId}&type=${type}&page=1`;
    } else {
        url = `/schedules?meetupId=${meetupId}&page=1`;
    }

    $.ajax({
        url: url,
        type: 'get',
        success: function(response) {
            console.log(response);
            updateScheduleList(response.responses);

            if (response.responses.length === 0) {
                updateSchedulePagination(1, 1, 1);
            } else {
                updateSchedulePagination(response.currentPage, response.startPage, response.endPage);
            }
        },
        error: function(errorResponse) {
            alert(errorResponse.responseJSON.messages.error);
        }
    });
}
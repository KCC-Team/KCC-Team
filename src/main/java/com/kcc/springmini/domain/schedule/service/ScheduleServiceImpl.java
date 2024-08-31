package com.kcc.springmini.domain.schedule.service;

import com.kcc.springmini.domain.schedule.model.Schedule;
import com.kcc.springmini.domain.schedule.model.dto.PageDto;
import com.kcc.springmini.domain.schedule.repository.ScheduleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ScheduleServiceImpl implements ScheduleService {
    private final ScheduleRepository scheduleRepository;

    @Transactional
    @Override
    public void save(long meetupId, Schedule schedule) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");

        schedule.setMeet_up_id(meetupId);
        schedule.setDeadline(String.valueOf(LocalDate.parse(schedule.getDeadline(), formatter)));
        schedule.setAppointment_time(String.valueOf(LocalDate.parse(schedule.getAppointment_time(), formatter)));
        scheduleRepository.save(schedule);
    }

    @Override
    public void update(Schedule schedule) {

    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public List<Schedule> findAll(Long meetUpId, int page) {
        int limit = 3;
        Map<String, Long> map = new HashMap<>();

//        PageDto pageDto = new PageDto(page, );
        map.put("meetUpId", meetUpId);
        map.put("limit", (long) limit);
        return scheduleRepository.findAll(map);
    }

    @Override
    public Schedule findById(Long id) {
        return null;
    }
}

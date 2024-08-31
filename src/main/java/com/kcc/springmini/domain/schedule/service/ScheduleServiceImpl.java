package com.kcc.springmini.domain.schedule.service;

import com.kcc.springmini.domain.schedule.model.ScheduleVO;
import com.kcc.springmini.domain.schedule.model.dto.PageResponseDto;
import com.kcc.springmini.domain.schedule.model.dto.ScheduleResponseDto;
import com.kcc.springmini.domain.schedule.repository.ScheduleRepository;
import com.kcc.springmini.global.exception.BadRequestException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ScheduleServiceImpl implements ScheduleService {
    private final ScheduleRepository scheduleRepository;

    private static final int LIMIT = 3;
    private static final int PAGE_LIMIT_SIZE = 5;

    @Transactional
    @Override
    public void save(long meetupId, ScheduleVO scheduleVO) {
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        scheduleVO.setMeet_up_id(meetupId);
        scheduleVO.setDeadline(LocalDateTime.parse(scheduleVO.getDeadline(), inputFormatter).format(outputFormatter));
        scheduleVO.setAppointment_time(LocalDateTime.parse(scheduleVO.getAppointment_time(), inputFormatter).format(outputFormatter));
        scheduleRepository.save(scheduleVO);
    }

    @Override
    public void delete(Long id) {
        scheduleRepository.delete(id);
    }

    @Override
    public ScheduleVO findById(Long id) {
        return scheduleRepository.findById(id);
    }

    @Override
    public PageResponseDto findAll(Long meetUpId, int page) {
        Map<String, Long> map = prepareParameters(meetUpId, page, LIMIT);
        List<ScheduleVO> schedules = scheduleRepository.findAll(map);
        List<ScheduleResponseDto> list = convertToDtoList(schedules);

        Long totalCount = scheduleRepository.count(meetUpId);
        int realEndPage = (int) Math.ceil((double) totalCount / LIMIT);
        int startPage = Math.max((((page - 1) / PAGE_LIMIT_SIZE) * PAGE_LIMIT_SIZE + 1), 1);
        int endPage = Math.min(startPage + PAGE_LIMIT_SIZE - 1, realEndPage);
        if (page < 1 || page > realEndPage) {
            throw new BadRequestException("존재하지 않는 페이지입니다.", HttpStatus.BAD_REQUEST);
        }

        return new PageResponseDto(page, startPage, endPage, list);
    }

    private Map<String, Long> prepareParameters(Long meetUpId, int page, int limit) {
        Map<String, Long> map = new HashMap<>();
        map.put("meetUpId", meetUpId);
        map.put("offset", (long) (page - 1) * limit);
        map.put("limit", (long) limit);
        return map;
    }

    private List<ScheduleResponseDto> convertToDtoList(List<ScheduleVO> schedules) {
        return schedules.stream().map(schedule -> ScheduleResponseDto.builder()
                .title(schedule.getTitle())
                .content(schedule.getContent())
                .person(schedule.getPerson())
                .deadline(schedule.getDeadline())
                .appointment_time(schedule.getAppointment_time())
                .build()).toList();
    }
}

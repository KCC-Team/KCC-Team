package com.kcc.springmini.domain.common.service;

import com.kcc.springmini.domain.schedule.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class SchedulerService {
    private final ScheduleService scheduleService;

    // 1시간 마다
    @Scheduled(cron = "0 0 * * * ?")
    public void runEveryHour() {
        scheduleService.checkDeadline();
        log.info("everyHour Scheduler run");
    }
}

package com.kcc.springmini.domain.meetup.repository.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MeetUpMapper {
    int getMemberTotal(Long meetUpId);
}

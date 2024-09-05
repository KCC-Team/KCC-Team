package com.kcc.springmini.domain.common.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface FileMapper {
    int saveFile(Map<String, Object> map);
    int saveMemberFile(Map<String, Object> map);
    String getUrl(Map<String, Object> map);
}

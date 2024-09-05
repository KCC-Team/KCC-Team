package com.kcc.springmini.domain.meetup.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MeetUpVO implements Serializable {
    private Long meet_up_id;
    private String title;
    private Long person;
    private String category;
    private String intro;
    private String url;
}

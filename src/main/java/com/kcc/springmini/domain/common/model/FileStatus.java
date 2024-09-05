package com.kcc.springmini.domain.common.model;

import lombok.Getter;

@Getter
public enum FileStatus {
    MEETUP("meetup"),
    MEMBER("member");

    private final String value;

    FileStatus(String value) {
        this.value = value;
    }

    public static FileStatus isStatus(String value) {
        for (FileStatus status : values()) {
            if (status.value.equals(value)) {
                return status;
            }
        }
        return null;
    }
}

package com.ocp.ocp_finalproject.workflow.dto;

import com.ocp.ocp_finalproject.workflow.domain.RecurrenceRule;
import com.ocp.ocp_finalproject.workflow.enums.RepeatType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Builder
@AllArgsConstructor
public class RecurrenceRuleDto {
    private RepeatType repeatType;

    private Integer repeatInterval;

    private List<Integer> daysOfWeek;

    private List<Integer> daysOfMonth;

    private List<String> timesOfDay;

    private LocalDateTime startAt;

    private LocalDateTime endAt;

    public static RecurrenceRuleDto from(RecurrenceRule rule) {
        return RecurrenceRuleDto.builder()
                .repeatType(rule.getRepeatType())
                .repeatInterval(rule.getRepeatInterval())
                .daysOfWeek(rule.getDaysOfWeek())
                .daysOfMonth(rule.getDaysOfMonth())
                .timesOfDay(rule.getTimesOfDay())
                .startAt(rule.getStartAt())
                .endAt(rule.getEndAt())
                .build();
    }

}
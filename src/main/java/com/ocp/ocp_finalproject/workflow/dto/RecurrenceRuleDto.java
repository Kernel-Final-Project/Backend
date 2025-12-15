package com.ocp.ocp_finalproject.workflow.dto;

import com.ocp.ocp_finalproject.workflow.domain.RecurrenceRule;
import com.ocp.ocp_finalproject.workflow.enums.RepeatType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class RecurrenceRuleDto {
    private final RepeatType repeatType;

    private final Integer repeatInterval;

    private final List<Integer> daysOfWeek;

    private final List<Integer> daysOfMonth;

    private final List<String> timesOfDay;

    private final LocalDateTime startAt;

    private final LocalDateTime endAt;

    private String readableRule;

    public static RecurrenceRuleDto from(RecurrenceRule rule) {
        return RecurrenceRuleDto.builder()
                .repeatType(rule.getRepeatType())
                .repeatInterval(rule.getRepeatInterval())
                .daysOfWeek(rule.getDaysOfWeek())
                .daysOfMonth(rule.getDaysOfMonth())
                .timesOfDay(rule.getTimesOfDay())
                .startAt(rule.getStartAt())
                .endAt(rule.getEndAt())
                .readableRule(rule.getReadableRule())
                .build();
    }

}
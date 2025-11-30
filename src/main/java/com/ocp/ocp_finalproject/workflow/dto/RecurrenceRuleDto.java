package com.ocp.ocp_finalproject.workflow.dto;

import com.ocp.ocp_finalproject.workflow.enums.RepeatType;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public class RecurrenceRuleDto {
    private RepeatType repeatType;

    private Integer repeatInterval;

    private List<Integer> daysOfWeek;

    private List<Integer> daysOfMonth;

    private List<String> timesOfDay;

    private LocalDateTime startAt;

    private LocalDateTime endAt;

    public String getDaysOfWeekAsString() {
        if (daysOfWeek == null || daysOfWeek.isEmpty()) {
            return null;
        }
        return daysOfWeek.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));
    }

    public String getDaysOfMonthAsString() {
        if (daysOfMonth == null || daysOfMonth.isEmpty()) {
            return null;
        }
        return daysOfMonth.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));
    }

    public String getTimesOfDayAsString() {
        if (timesOfDay == null || timesOfDay.isEmpty()) {
            return null;
        }
        return String.join(",", timesOfDay);
    }

}
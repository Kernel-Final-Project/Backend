package com.ocp.ocp_finalproject.workflow.util;

import com.ocp.ocp_finalproject.workflow.domain.RecurrenceRule;
import com.ocp.ocp_finalproject.workflow.enums.RepeatType;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * RecurrenceRule 엔티티에 저장된 정보를 Quartz Cron 표현식으로 변환한다.
 */
public class RecurrenceRuleCronConverter {

    public static String toCron(RecurrenceRule rule) {
        if (rule == null) {
            throw new IllegalArgumentException("RecurrenceRule이 null입니다.");
        }

        RepeatType repeatType = rule.getRepeatType() != null ? rule.getRepeatType() : RepeatType.DAILY;

        LocalDateTime startAt = rule.getStartAt();
        LocalTime executionTime = resolveTime(rule.getTimesOfDay(), startAt);

        String second = "0";
        String minute = formatNumber(executionTime.getMinute());
        String hour = formatNumber(executionTime.getHour());
        String dayOfMonth = "*";
        String month = "*";
        String dayOfWeek = "?";
        String year = "";

        switch (repeatType) {
            case ONCE -> {
                if (startAt == null) {
                    throw new IllegalArgumentException("ONCE 반복 유형은 startAt 값이 필요합니다.");
                }
                minute = formatNumber(startAt.getMinute());
                hour = formatNumber(startAt.getHour());
                dayOfMonth = String.valueOf(startAt.getDayOfMonth());
                month = String.valueOf(startAt.getMonthValue());
                dayOfWeek = "?";
                year = String.valueOf(startAt.getYear());
            }
            case DAILY -> {
                dayOfMonth = everyNDays(rule.getRepeatInterval(), startAt);
                dayOfWeek = "?";
            }
            case WEEKLY -> {
                dayOfMonth = "?";
                dayOfWeek = formatDayOfWeek(rule.getDaysOfWeek(), startAt);
            }
            case MONTHLY -> {
                dayOfMonth = formatDayOfMonth(rule.getDaysOfMonth(), startAt);
                month = everyNMonths(rule.getRepeatInterval(), startAt);
                dayOfWeek = "?";
            }
            case CUSTOM -> {
                if (hasValues(rule.getDaysOfMonth())) {
                    dayOfMonth = formatDayOfMonth(rule.getDaysOfMonth(), startAt);
                    dayOfWeek = "?";
                } else if (hasValues(rule.getDaysOfWeek())) {
                    dayOfMonth = "?";
                    dayOfWeek = formatDayOfWeek(rule.getDaysOfWeek(), startAt);
                } else {
                    dayOfMonth = everyNDays(rule.getRepeatInterval(), startAt);
                    dayOfWeek = "?";
                }
            }
            default -> {
                dayOfMonth = everyNDays(rule.getRepeatInterval(), startAt);
                dayOfWeek = "?";
            }
        }

        String cron = String.format("%s %s %s %s %s %s", second, minute, hour, dayOfMonth, month, dayOfWeek);
        if (!year.isBlank()) {
            cron = cron + " " + year;
        }
        return cron;
    }

    private static LocalTime resolveTime(List<String> timesOfDay, LocalDateTime startAt) {
        LocalTime fromRule = extractTime(timesOfDay);
        if (fromRule != null) {
            return fromRule;
        }

        if (startAt != null) {
            return startAt.toLocalTime();
        }

        return LocalTime.MIDNIGHT;
    }

    private static LocalTime extractTime(List<String> timesOfDay) {
        if (timesOfDay == null) {
            return null;
        }

        for (String timeValue : timesOfDay) {
            if (timeValue == null || timeValue.isBlank()) {
                continue;
            }
            try {
                return LocalTime.parse(timeValue);
            } catch (DateTimeParseException ignored) {
                return parseLenient(timeValue);
            }
        }

        return null;
    }

    private static LocalTime parseLenient(String value) {
        String[] parts = value.trim().split(":");
        if (parts.length >= 2) {
            int hour = Integer.parseInt(parts[0]);
            int minute = Integer.parseInt(parts[1]);
            return LocalTime.of(hour, minute);
        }
        throw new IllegalArgumentException("지원하지 않는 시간 형식입니다. value=" + value);
    }

    private static String everyNDays(Integer interval, LocalDateTime startAt) {
        if (interval == null || interval <= 1) {
            return "*";
        }
        int startDay = startAt != null ? startAt.getDayOfMonth() : 1;
        return startDay + "/" + interval;
    }

    private static String everyNMonths(Integer interval, LocalDateTime startAt) {
        if (interval == null || interval <= 1) {
            return "*";
        }
        int startMonth = startAt != null ? startAt.getMonthValue() : 1;
        return startMonth + "/" + interval;
    }

    private static boolean hasValues(List<?> values) {
        return values != null && !values.isEmpty();
    }

    private static String formatDayOfMonth(List<Integer> daysOfMonth, LocalDateTime startAt) {
        List<Integer> days = sanitizeIntegerList(daysOfMonth);
        if (days.isEmpty() && startAt != null) {
            return String.valueOf(startAt.getDayOfMonth());
        }
        if (days.isEmpty()) {
            return "*";
        }

        return days.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));
    }

    private static String formatDayOfWeek(List<Integer> daysOfWeek, LocalDateTime startAt) {
        List<Integer> days = sanitizeIntegerList(daysOfWeek);
        if (days.isEmpty() && startAt != null) {
            days = List.of(startAt.getDayOfWeek().getValue());
        }

        if (days.isEmpty()) {
            return "*";
        }

        return days.stream()
                .map(RecurrenceRuleCronConverter::toCronDayOfWeek)
                .collect(Collectors.joining(","));
    }

    private static List<Integer> sanitizeIntegerList(List<Integer> source) {
        if (source == null) {
            return Collections.emptyList();
        }
        return source.stream()
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    private static String toCronDayOfWeek(Integer value) {
        if (value < 1 || value > 7) {
            throw new IllegalArgumentException("요일 값은 1~7 사이여야 합니다. value=" + value);
        }
        DayOfWeek dayOfWeek = DayOfWeek.of(value);
        return dayOfWeek.name().substring(0, 3);
    }

    private static String formatNumber(int value) {
        return String.format("%02d", value);
    }
}

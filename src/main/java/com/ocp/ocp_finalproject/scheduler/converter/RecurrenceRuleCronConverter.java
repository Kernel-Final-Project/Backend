package com.ocp.ocp_finalproject.scheduler.converter;

import com.ocp.ocp_finalproject.workflow.domain.RecurrenceRule;

import java.time.DayOfWeek;
import java.util.List;
import java.util.stream.Collectors;

public class RecurrenceRuleCronConverter {

    public static String toCron(RecurrenceRule rule) {
        if (rule == null) {
            throw new IllegalArgumentException("RecurrenceRule이 null입니다.");
        }

        // 1. 초
        String second = "0";

        // 2. 분/시
        String[] times = parseTimes(rule.getTimesOfDay());
        String minute = times[1];
        String hour = times[0];

        // 3. 일
        String dayOfMonth = parseDaysOfMonth(rule.getDaysOfMonth());

        // 4. 월
        String month = "*"; // 기본: 매월

        // 5. 요일
        String dayOfWeek = parseDaysOfWeek(rule.getDaysOfWeek());

        return String.format("%s %s %s %s %s %s", second, minute, hour, dayOfMonth, month, dayOfWeek);
    }

    private static String[] parseTimes(String timesOfDayJson) {
        // JSON -> List<String> 처리
        // 예: ["09:30", "14:00"] 중 첫 번째 시간 사용
        List<String> times = JsonUtils.parseStringList(timesOfDayJson); // ObjectMapper로 파싱
        if (times.isEmpty()) {
            return new String[]{"0", "0"}; // 기본 00:00
        }
        String[] parts = times.get(0).split(":");
        return new String[]{parts[0], parts[1]}; // [hour, minute]
    }

    private static String parseDaysOfMonth(String daysOfMonthJson) {
        List<Integer> days = JsonUtils.parseIntegerList(daysOfMonthJson);
        if (days.isEmpty()) {
            return "?"; // ? 사용 → 요일 기반 스케줄링 가능
        }
        return days.stream().map(String::valueOf).collect(Collectors.joining(","));
    }

    private static String parseDaysOfWeek(String daysOfWeekJson) {
        List<String> days = JsonUtils.parseStringList(daysOfWeekJson);
        if (days.isEmpty()) {
            return "?"; // ? 사용 → 날짜 기반 스케줄링 가능
        }
        // Quartz 요일 표현: MON, TUE, WED, ...
        return days.stream()
                .map(d -> DayOfWeek.valueOf(d.toUpperCase()).name())
                .collect(Collectors.joining(","));
    }
}

package com.ocp.ocp_finalproject.workflow.dto;

import com.ocp.ocp_finalproject.workflow.enums.RepeatType;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class RecurrenceRuleDto {
    private RepeatType repeatType;

    private Integer repeatInterval;

    private String daysOfWeek;

    private String daysOfMonth;

    private String timesOfDay;

    // 반복 규칙을 사람이 읽기 쉬운 문자열로 변환
    public String getReadableRecurrenceRule() {
        StringBuilder sb = new StringBuilder();

        switch (repeatType) {
            case ONCE:
                return "1회만 실행";
            case DAILY:
                sb.append("매일");
                break;
            case WEEKLY:
                sb.append("매주 ").append(getReadableDaysWeek());
                break;
            case MONTHLY:
                sb.append("매달 ").append(getReadableDaysOfMonth());
                break;
            case CUSTOM:
                sb.append("사용자 정의");
                break;
        }

        if (repeatInterval != null && repeatInterval > 1) {
            sb.append(" (").append(repeatInterval).append("번째마다)");
        }

        if (timesOfDay != null && !timesOfDay.isEmpty()) {
            sb.append(" ").append(getReadableTimesOfDay()).append("에 실행");
        }

        return sb.toString();
    }

    // 요일 -> 한글로 변환
    public String getReadableDaysWeek() {

        if (daysOfWeek == null || daysOfWeek.isEmpty()) {
            return "";
        }

        try {
            String[] days = daysOfWeek.replace("[", "")
                    .replace("]", "")
                    .replace("\"", "")
                    .split(",");

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < days.length; i++) {
                String day = days[i].trim();
                sb.append(convertDayToKorean(day));

                if (i < days.length - 1) {
                    sb.append(", ");
                }
            }
            sb.append("요일");

            return sb.toString();
        } catch (Exception e) {
            return daysOfWeek;
        }

    }

    // 일자를 읽기 쉽게 변환
    public String getReadableDaysOfMonth() {
        if (daysOfMonth == null || daysOfMonth.isEmpty()) {
            return "";
        }

        try {
            String[] days = daysOfMonth.replace("[", "")
                    .replace("]", "")
                    .split(",");

            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < days.length; i++) {
                sb.append(days[i].trim()).append("일");
                if(i < days.length -1) {
                    sb.append(", ");
                }
            }

            return sb.toString();
        } catch(Exception e) {
            return daysOfMonth;
        }
    }

    // 시간을 읽기 쉽게 변환
    public String getReadableTimesOfDay() {
        if(timesOfDay == null || timesOfDay.isEmpty()) {
            return "";
        }

        try {
            return timesOfDay.replace("[", "")
                    .replace("]", "")
                    .replace("\"", "");
        } catch (Exception e) {
            return timesOfDay;
        }
    }

    private String convertDayToKorean(String day) {
        return switch (day.toUpperCase()) {
            case "MON" -> "월";
            case "TUE" -> "화";
            case "WED" -> "수";
            case "THU" -> "목";
            case "FRI" -> "금";
            case "SAT" -> "토";
            case "SUN" -> "일";
            default -> day;
        };
    }

}

package com.ocp.ocp_finalproject.workflow.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.workflow.enums.RepeatType;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "recurrence_rule")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class RecurrenceRule extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recurrence_rule_id")
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "repeat_type", length = 50)
    private RepeatType repeatType;

    @Column(name = "repeat_interval")
    private Integer repeatInterval;

    @Column(name = "days_of_week", length = 500, columnDefinition = "JSON")
    private String daysOfWeek;

    @Column(name = "days_of_month", columnDefinition = "JSON")
    private String daysOfMonth;

    @Column(name = "times_of_day", length = 500)
    private String timesOfDay;

    @Column(name = "readable_rule", length = 100)
    private String readableRule;

    @Column(name = "start_at", nullable = false)
    private LocalDateTime startAt;

    @Column(name = "end_at")
    private LocalDateTime endAt;

    @Builder(builderMethodName = "createBuilder")
    public static RecurrenceRule create(
            RepeatType repeatType,
            Integer repeatInterval,
            String daysOfWeek,
            String daysOfMonth,
            String timesOfDay,
            LocalDateTime startAt,
            LocalDateTime endAt
    ) {
        RecurrenceRule recurrenceRule = new RecurrenceRule();
        recurrenceRule.repeatType = repeatType;
        recurrenceRule.repeatInterval = repeatInterval;
        recurrenceRule.daysOfWeek = daysOfWeek;
        recurrenceRule.daysOfMonth = daysOfMonth;
        recurrenceRule.timesOfDay = timesOfDay;
        recurrenceRule.startAt = startAt;
        recurrenceRule.endAt = endAt;
        return recurrenceRule;
    }
}
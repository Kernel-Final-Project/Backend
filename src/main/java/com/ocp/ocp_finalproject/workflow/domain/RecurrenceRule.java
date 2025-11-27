package com.ocp.ocp_finalproject.workflow.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.workflow.enums.RepeatType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "recurrence_rule")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RecurrenceRule extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long recurrenceRuleId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "workflow_id")
    private Workflow workflow;

    @Column(name = "repeat_type")
    @Enumerated(EnumType.STRING)
    private RepeatType repeatType;

    @Column(name = "repeat_interval", columnDefinition = "JSON")
    private Integer repeatInterval;

    @Column(name = "days_of_week", columnDefinition = "JSON")
    private String daysOfWeek;

    @Column(name = "days_of_month", columnDefinition = "JSON")
    private String daysOfMonth;

    @Column(name = "times_of_day")
    private String timesOfDay;

    @Column(name = "start_at", nullable = false)
    private LocalDateTime startAt;

    @Column(name = "end_at")
    private LocalDateTime endAt;
}
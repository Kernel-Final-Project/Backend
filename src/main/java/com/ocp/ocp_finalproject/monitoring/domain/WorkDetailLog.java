package com.ocp.ocp_finalproject.monitoring.domain;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

/**
 * 작업 상세 로그 엔티티
 * 작업(Work) 실행 단계별 로그 기록
 */
@Entity
@Table(name = "work_detail_log")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class WorkDetailLog {

    /**
     * 로그 ID (Primary Key)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "log_id", nullable = false)
    private Long logId;

    /**
     * 작업 ID (Foreign Key)
     */
    @Column(name = "work_id", nullable = false)
    private Long workId;

    /**
     * 단계 번호
     */
    @Column(name = "step_number")
    private Integer stepNumber;

    /**
     * 단계 이름
     */
    @Column(name = "step_name", length = 100)
    private String stepName;

    /**
     * 로그 데이터
     */
    @Column(name = "log_data", columnDefinition = "TEXT")
    private String logData;

    /**
     * 상태
     */
    @Column(name = "status", length = 20)
    private String status;

    /**
     * 로그 레벨
     */
    @Column(name = "log_level", length = 100)
    private String logLevel;

    /**
     * 생성 일시
     */
    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
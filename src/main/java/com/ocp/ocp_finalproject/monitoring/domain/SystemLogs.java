package com.ocp.ocp_finalproject.monitoring.domain;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

/**
 * 시스템 로그 엔티티
 * 시스템 전반의 로그 및 에러 기록
 */
@Entity
@Table(name = "system_logs")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class SystemLogs {

    /**
     * 로그 ID (Primary Key)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "log_id", nullable = false)
    private Long logId;

    /**
     * 로그 레벨 (INFO, WARN, ERROR 등)
     */
    @Column(name = "log_level", length = 10)
    private String logLevel;

    /**
     * 로그 메시지
     */
    @Column(name = "message", columnDefinition = "TEXT")
    private String message;

    /**
     * 에러 타입
     */
    @Column(name = "error_type", length = 50)
    private String errorType;

    /**
     * 작업 타입
     */
    @Column(name = "task_type", length = 50)
    private String taskType;

    /**
     * IP 주소
     */
    @Column(name = "ip_address", length = 45)
    private String ipAddress;

    /**
     * 스택 트레이스
     */
    @Column(name = "stack_trace", columnDefinition = "TEXT")
    private String stackTrace;

    /**
     * 요청 데이터 (JSON)
     */
    @Column(name = "request_data", columnDefinition = "JSON")
    private String requestData;

    /**
     * 생성 일시
     */
    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
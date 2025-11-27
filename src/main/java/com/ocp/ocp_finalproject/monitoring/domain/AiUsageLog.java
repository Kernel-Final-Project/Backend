package com.ocp.ocp_finalproject.monitoring.domain;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * AI 사용 로그 엔티티
 * AI 모델 사용 내역 및 비용 기록
 */
@Entity
@Table(name = "ai_usage_log")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class AiUsageLog {

    /**
     * 사용 로그 ID (Primary Key)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "usage_log_id", nullable = false)
    private Long usageLogId;

    /**
     * 기능 타입
     */
    @Column(name = "feature_type", length = 50)
    private String featureType;

    /**
     * AI 모델명
     */
    @Column(name = "model", length = 50)
    private String model;

    /**
     * 프롬프트 토큰 수
     */
    @Column(name = "prompt_tokens")
    private Integer promptTokens;

    /**
     * 완성 토큰 수
     */
    @Column(name = "completion_tokens")
    private Integer completionTokens;

    /**
     * 총 토큰 수
     */
    @Column(name = "total_tokens")
    private Integer totalTokens;

    /**
     * 예상 비용
     */
    @Column(name = "estimated_cost", precision = 10, scale = 6)
    private BigDecimal estimatedCost;

    /**
     * 생성 일시
     */
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    /**
     * 작업 ID (Foreign Key)
     */
    @Column(name = "work_id", nullable = false)
    private Long workId;

    /**
     * 사용자 ID (Foreign Key)
     */
    @Column(name = "user_id", nullable = false)
    private Long userId;
}
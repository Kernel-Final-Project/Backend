package com.ocp.ocp_finalproject.content.domain;

import com.ocp.ocp_finalproject.common.entity.BaseEntity;
import com.ocp.ocp_finalproject.content.enums.ContentStatus;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Table(name = "ai_content")
public class AiContent extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ai_content_id")
    private Long aiContentId;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String content;

    @Column(name = "choice_product", nullable = false)
    private String choiceProduct;

    @Column(name = "choice_trend_keyword", nullable = false)
    private String choiceTrendKeyword;

    @Enumerated(EnumType.STRING)     // ★ 필수
    private ContentStatus status;

    @Column(name = "started_at")
    private LocalDateTime startedAt;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    @OneToOne
    @JoinColumn(name = "work_id", nullable = false)
    private Work work;

    @Builder(builderMethodName = "createBuilder")
    public static AiContent create(
            String title,
            String content,
            String choiceProduct,
            String choiceTrendKeyword,
            ContentStatus status,      // ★ 누락된 필드 추가
            LocalDateTime startedAt,
            LocalDateTime completedAt,
            Work work
    ) {
        AiContent aiContent = new AiContent();
        aiContent.title = title;
        aiContent.content = content;
        aiContent.choiceProduct = choiceProduct;
        aiContent.choiceTrendKeyword = choiceTrendKeyword;
        aiContent.status = status;
        aiContent.startedAt = startedAt;
        aiContent.completedAt = completedAt;
        aiContent.setWork(work);
        return aiContent;
    }

    // 편의 메서드 (양방향일 경우 필요)
    public void setWork(Work work) {
        this.work = work;
        if (work.getAiContent() != this) {
            work.setAiContent(this);
        }
    }
}

package com.ocp.ocp_finalproject.content.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

/**
 * 블로그 포스트 발행 상태
 */
@Getter
@RequiredArgsConstructor
public enum PostStatus {

    SCHEDULED("예약", "발행 예약됨"),
    PUBLISHING("발행중", "블로그에 발행 중"),
    PUBLISHED("발행완료", "블로그에 발행 완료"),
    FAILED("실패", "발행 실패");

    private final String displayName;
    private final String description;

    /**
     * 발행 완료 여부
     */
    public boolean isPublished() {
        return this == PUBLISHED;
    }

    /**
     * 발행 대기 중 여부
     */
    public boolean isWaiting() {
        return this == SCHEDULED;
    }

    /**
     * 발행 진행 중 여부
     */
    public boolean isInProgress() {
        return this == PUBLISHING;
    }

    /**
     * 재시도 가능 여부
     */
    public boolean canRetry() {
        return this == FAILED;
    }

    /**
     * 취소 가능 여부
     */
    public boolean canCancel() {
        return this == SCHEDULED;
    }
}

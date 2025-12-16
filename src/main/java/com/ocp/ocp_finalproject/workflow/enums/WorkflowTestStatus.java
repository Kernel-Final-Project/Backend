package com.ocp.ocp_finalproject.workflow.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum WorkflowTestStatus {

    TEST_IN_PROGRESS("테스트 진행 중", "퀵 테스트 실행 중"),
    TEST_PASSED("테스트 성공", "모든 단계(콘텐츠 생성 + 블로그 업로드) 성공"),
    TEST_FAILED("테스트 실패", "테스트 중 하나 이상의 단계 실패");

    private final String displayName;
    private final String description;

    /**
     * 테스트 진행 중 여부
     */
    public boolean isInProgress() {
        return this == TEST_IN_PROGRESS;
    }

    /**
     * 테스트 완료 여부
     */
    public boolean isCompleted() {
        return this == TEST_PASSED || this == TEST_FAILED;
    }

    /**
     * 테스트 성공 여부
     */
    public boolean isPassed() {
        return this == TEST_PASSED;
    }
}
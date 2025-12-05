package com.ocp.ocp_finalproject.work.controller;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.common.response.ApiResult;
import com.ocp.ocp_finalproject.work.config.KeywordSelectProperties;
import com.ocp.ocp_finalproject.work.dto.request.KeywordSelectWebhookRequest;
import com.ocp.ocp_finalproject.work.service.KeywordSelectWebhookService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/v1/work/keyword/webhook")
@RequiredArgsConstructor
public class KeywordSelectWebhookController {

    private final KeywordSelectProperties keywordSelectProperties;
    private final KeywordSelectWebhookService webhookService;

    @PostMapping
    public ApiResult<Void> handleWebhook(
            @RequestHeader(value = "Authorization", required = false) String authorization,
            @RequestBody KeywordSelectWebhookRequest request
    ) {
        validateSecret(authorization);
        webhookService.handleResult(request);
        return ApiResult.success("키워드 선택 결과를 처리했습니다.");
    }

    private void validateSecret(String authorizationHeader) {
        String expectedSecret = keywordSelectProperties.getWebhookSecret();
        if (expectedSecret == null || expectedSecret.isBlank()) {
            log.warn("웹훅 시크릿이 설정되지 않았습니다.");
            throw new CustomException(ErrorCode.WORK_WEBHOOK_TOKEN_INVALID, "웹훅 시크릿이 설정되지 않았습니다.");
        }

        if (authorizationHeader == null || !authorizationHeader.equals(expectedSecret)) {
            throw new CustomException(ErrorCode.WORK_WEBHOOK_TOKEN_INVALID);
        }
    }
}

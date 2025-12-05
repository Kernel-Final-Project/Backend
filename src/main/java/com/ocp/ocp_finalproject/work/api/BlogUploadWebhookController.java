package com.ocp.ocp_finalproject.work.api;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.common.response.ApiResponse;
import com.ocp.ocp_finalproject.work.config.BlogUploadProperties;
import com.ocp.ocp_finalproject.work.dto.request.BlogUploadWebhookRequest;
import com.ocp.ocp_finalproject.work.service.BlogUploadWebhookService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/v1/work/blog/webhook")
@RequiredArgsConstructor
public class BlogUploadWebhookController {

    private static final String WEBHOOK_HEADER = "X-WEBHOOK-SECRET";

    private final BlogUploadWebhookService webhookService;
    private final BlogUploadProperties blogUploadProperties;

    @PostMapping
    public ApiResponse<Void> handleWebhook(
            @RequestHeader(value = WEBHOOK_HEADER, required = false) String secretHeader,
            @RequestBody BlogUploadWebhookRequest request
    ) {
        validateSecret(secretHeader);
        webhookService.handleResult(request);
        return ApiResponse.success("블로그 업로드 결과를 처리했습니다.");
    }

    private void validateSecret(String secretHeader) {
        String expectedSecret = blogUploadProperties.getWebhookSecret();
        if (expectedSecret == null || expectedSecret.isBlank()) {
            log.warn("웹훅 시크릿이 설정되지 않았습니다.");
            throw new CustomException(ErrorCode.WORK_WEBHOOK_TOKEN_INVALID, "웹훅 시크릿이 설정되지 않았습니다.");
        }

        if (secretHeader == null || !secretHeader.equals(expectedSecret)) {
            throw new CustomException(ErrorCode.WORK_WEBHOOK_TOKEN_INVALID);
        }
    }
}

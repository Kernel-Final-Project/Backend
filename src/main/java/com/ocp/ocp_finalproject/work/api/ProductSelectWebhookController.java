package com.ocp.ocp_finalproject.work.api;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.common.response.ApiResponse;
import com.ocp.ocp_finalproject.work.config.ProductSelectProperties;
import com.ocp.ocp_finalproject.work.dto.request.ProductSelectWebhookRequest;
import com.ocp.ocp_finalproject.work.service.ProductSelectWebhookService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/v1/webhooks/product-select")
@RequiredArgsConstructor
public class ProductSelectWebhookController {

    private static final String WEBHOOK_HEADER = "X-WEBHOOK-SECRET";

    private final ProductSelectProperties productSelectProperties;
    private final ProductSelectWebhookService webhookService;

    @PostMapping
    public ApiResponse<Void> handleWebhook(
            @RequestHeader(value = WEBHOOK_HEADER, required = false) String secretHeader,
            @RequestBody ProductSelectWebhookRequest request
    ) {
        validateSecret(secretHeader);
        webhookService.handleResult(request);
        return ApiResponse.success("상품 선택 결과를 처리했습니다.");
    }

    private void validateSecret(String secretHeader) {
        String expectedSecret = productSelectProperties.getWebhookSecret();
        if (expectedSecret == null || expectedSecret.isBlank()) {
            log.warn("상품 선택 웹훅 시크릿이 설정되지 않았습니다.");
            throw new CustomException(ErrorCode.WORK_WEBHOOK_TOKEN_INVALID, "웹훅 시크릿이 설정되지 않았습니다.");
        }

        if (secretHeader == null || !secretHeader.equals(expectedSecret)) {
            throw new CustomException(ErrorCode.WORK_WEBHOOK_TOKEN_INVALID);
        }
    }
}

package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.work.config.BlogUploadProperties;
import com.ocp.ocp_finalproject.work.dto.request.BlogUploadRequest;
import com.ocp.ocp_finalproject.work.producer.BlogUploadProducer;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BlogUploadService {

    private final BlogUploadProducer producer;
    private final BlogUploadProperties blogUploadProperties;

    public void sendBlogUpload(BlogUploadRequest request) {
        String secret = blogUploadProperties.getWebhookSecret();
        if (secret == null || secret.isBlank()) {
            throw new CustomException(ErrorCode.WORK_WEBHOOK_TOKEN_INVALID, "웹훅 시크릿이 설정되지 않았습니다.");
        }
        applyDefaultWebhookUrlIfNeeded(request);
        request.setWebhookToken(secret);
        producer.send(request);
    }

/*
    public BlogUploadRequest buildBlogUploadRequest(Workflow workflow) {

        /*
            1. workflow를 기준으로 work테이블에서 status가 CONTENT_GENERATED인 애들을 찾는다.
            2. workflow를 기준으로 블로그타입, blogId, logPassword, blogUrl을 받아온다.
            3. AiContent에서 title, content를 받아온다

            request객체를 리턴한다.


    }
    */

    private void applyDefaultWebhookUrlIfNeeded(BlogUploadRequest request) {
        if (request.getWebhookUrl() != null && !request.getWebhookUrl().isBlank()) {
            return;
        }

        String defaultWebhookUrl = blogUploadProperties.getWebhookUrl();
        if (defaultWebhookUrl == null || defaultWebhookUrl.isBlank()) {
            throw new CustomException(ErrorCode.WORK_WEBHOOK_URL_NOT_CONFIGURED, "웹훅 URL이 설정되지 않았습니다.");
        }
        request.setWebhookUrl(defaultWebhookUrl);
    }
}

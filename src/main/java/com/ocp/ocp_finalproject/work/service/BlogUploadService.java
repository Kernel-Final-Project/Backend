package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.work.config.BlogUploadProperties;
import com.ocp.ocp_finalproject.work.dto.request.BlogUploadRequest;
import com.ocp.ocp_finalproject.work.producer.BlogUploadProducer;
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
        request.setWebhookToken(secret);
        producer.send(request);
    }

    public void sendScheduledBlogUploads() {
        /*
            BlogUploadRequest를 생성해서 BlogUploadProducer을 호출한다
         */
    }
}

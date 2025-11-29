package com.ocp.ocp_finalproject.work.producer;

import com.ocp.ocp_finalproject.config.RabbitConfig;
import com.ocp.ocp_finalproject.work.dto.request.BlogUploadRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BlogUploadProducer {
    private final RabbitTemplate rabbitTemplate;

    public void send(BlogUploadRequest request) {
        rabbitTemplate.convertAndSend(RabbitConfig.BLOG_UPLOAD_QUEUE, request);
    }
}

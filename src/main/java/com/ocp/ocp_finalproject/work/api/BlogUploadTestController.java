package com.ocp.ocp_finalproject.work.api;

import com.ocp.ocp_finalproject.work.dto.request.BlogUploadRequest;
import com.ocp.ocp_finalproject.work.producer.BlogUploadProducer;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/test/blog")
@RequiredArgsConstructor
public class BlogUploadTestController {

    private final BlogUploadProducer producer;

    @PostMapping("/send")
    public String sendBlogUpload(@RequestBody BlogUploadRequest request) {
        producer.send(request);
        return "Message sent to RabbitMQ!";
    }
}

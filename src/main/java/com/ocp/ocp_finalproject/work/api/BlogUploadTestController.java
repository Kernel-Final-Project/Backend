package com.ocp.ocp_finalproject.work.api;

import com.ocp.ocp_finalproject.message.blog.BlogUploadProducer;
import com.ocp.ocp_finalproject.message.blog.dto.BlogUploadRequest;
import com.ocp.ocp_finalproject.work.service.BlogUploadService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/test/blog")
@RequiredArgsConstructor
public class BlogUploadTestController {

    private final BlogUploadService blogUploadService;
    private final BlogUploadProducer blogUploadProducer;

    @PostMapping("/send")
    public String sendBlogUpload(@RequestBody BlogUploadRequest request) {
        BlogUploadRequest prepared = blogUploadService.prepareBlogUploadRequest(request);
        blogUploadProducer.send(prepared);
        return "Message sent to RabbitMQ!";
    }
}

package com.ocp.ocp_finalproject.work.service;

import com.ocp.ocp_finalproject.work.producer.BlogUploadProducer;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BlogUploadService {

    private final BlogUploadProducer producer;

    public void sendScheduledBlogUploads() {
        /*
            BlogUploadRequest를 생성해서 BlogUploadProducer을 호출한다
         */
    }
}

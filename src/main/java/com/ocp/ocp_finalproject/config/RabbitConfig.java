package com.ocp.ocp_finalproject.config;

import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.JacksonJsonMessageConverter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitConfig {



    public static final String CONTENT_GENERATE_QUEUE="content-generate-queue";



    public static final String BLOG_UPLOAD_QUEUE = "blog-upload-queue";


    // 콘텐츠 생성 큐
    @Bean
    public Queue contentRequestQueue() {
        return new Queue(CONTENT_GENERATE_QUEUE, true); // durable queue
    }


    // 블로그 업로드 큐
    @Bean
    public Queue blogUploadQueue() {
        return new Queue(BLOG_UPLOAD_QUEUE, true); // durable queue\\
    }

    @Bean
    public JacksonJsonMessageConverter messageConverter() {
        return new JacksonJsonMessageConverter();
    }

    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory,
                                         JacksonJsonMessageConverter messageConverter) {
        RabbitTemplate rabbitTemplate = new RabbitTemplate(connectionFactory);
        rabbitTemplate.setMessageConverter(messageConverter);
        return rabbitTemplate;
    }
}

package com.ocp.ocp_finalproject.scheduler.blog;

import com.ocp.ocp_finalproject.message.blog.BlogUploadProducer;
import com.ocp.ocp_finalproject.message.blog.dto.BlogUploadRequest;
import com.ocp.ocp_finalproject.work.service.BlogUploadService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.PersistJobDataAfterExecution;
import org.quartz.DisallowConcurrentExecution;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@RequiredArgsConstructor
@PersistJobDataAfterExecution
@DisallowConcurrentExecution
public class BlogUploadJob extends QuartzJobBean {

    private final BlogUploadService blogUploadService;
    private final BlogUploadProducer blogUploadProducer;

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        List<BlogUploadRequest> requests = blogUploadService.collectPendingBlogUploads();
        if (requests.isEmpty()) {
            log.debug("블로그 업로드 대상이 없습니다.");
            return;
        }

        for (BlogUploadRequest request : requests) {
            BlogUploadRequest prepared = blogUploadService.prepareBlogUploadRequest(request);
            blogUploadProducer.send(prepared);
            log.info("워크 {} 블로그 업로드 메시지를 전송했습니다.", prepared.getWorkId());
        }
    }
}

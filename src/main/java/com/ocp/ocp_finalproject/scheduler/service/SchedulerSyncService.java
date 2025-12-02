package com.ocp.ocp_finalproject.scheduler.service;

import com.ocp.ocp_finalproject.scheduler.converter.RecurrenceRuleCronConverter;
import com.ocp.ocp_finalproject.scheduler.job.BlogUploadJob;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import lombok.RequiredArgsConstructor;
import org.quartz.*;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SchedulerSyncService {

    private final Scheduler scheduler;

    public void registerWorkflowJobs(Workflow workflow) throws SchedulerException {

        /*
        // 1. 콘텐츠 생성 Job/Trigger 생성
        JobDetail contentJob = JobBuilder.newJob(ContentCreationJob.class)
                .withIdentity("content-create-" + workflow.getId())
                .usingJobData("workflowId", workflow.getId())
                .storeDurably()
                .build();

        Trigger contentTrigger = TriggerBuilder.newTrigger()
                .withIdentity("content-create-trigger-" + workflow.getId())
                .withSchedule(CronScheduleBuilder.cronSchedule(
                        RecurrenceRuleCronConverter.toCron(workflow.getContentRule())
                ))
                .build();

        scheduler.scheduleJob(contentJob, contentTrigger);

         */

        // 2. 블로그 업로드 Job
        JobDetail uploadJob = JobBuilder.newJob(BlogUploadJob.class)
                .withIdentity("blog-upload-" + workflow.getId())
                .usingJobData("workflowId", workflow.getId())
                .storeDurably()
                .build();

        Trigger uploadTrigger = TriggerBuilder.newTrigger()
                .withIdentity("blog-upload-trigger-" + workflow.getId())
                .withSchedule(CronScheduleBuilder.cronSchedule(
                        RecurrenceRuleCronConverter.toCron(workflow.getRecurrenceRule())
                ))
                .build();

        scheduler.scheduleJob(uploadJob, uploadTrigger);
    }

    public void updateWorkflowJobs(Workflow workflow) throws SchedulerException {
        removeWorkflowJobs(workflow.getId());
        registerWorkflowJobs(workflow);
    }

    public void removeWorkflowJobs(Long workflowId) {
        try {
            scheduler.deleteJob(new JobKey("content-create-" + workflowId));
            scheduler.deleteJob(new JobKey("blog-upload-" + workflowId));
        } catch (SchedulerException e) {
            throw new IllegalStateException(e);
        }
    }
}

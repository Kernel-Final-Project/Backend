package com.ocp.ocp_finalproject.scheduler.service;

import com.ocp.ocp_finalproject.workflow.util.RecurrenceRuleCronConverter;
import com.ocp.ocp_finalproject.scheduler.job.BlogUploadJob;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import lombok.RequiredArgsConstructor;
import org.quartz.*;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class SchedulerSyncService {

    private final Scheduler scheduler;

    public void startSchedulerIfNeeded() throws SchedulerException {
        if (!scheduler.isStarted()) {
            scheduler.start();  // 스케줄러 시작
        }
    }

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

        List<String> cronExpressions = RecurrenceRuleCronConverter.toCronExpressions(workflow.getRecurrenceRule());
        if (cronExpressions.isEmpty()) {
            throw new IllegalStateException("Blog upload Cron 표현식을 하나 이상 생성해야 합니다.");
        }
        List<Trigger> uploadTriggers = new ArrayList<>();
        String baseTriggerIdentity = "blog-upload-trigger-" + workflow.getId();
        for (int i = 0; i < cronExpressions.size(); i++) {
            String triggerId = cronExpressions.size() == 1 ? baseTriggerIdentity : baseTriggerIdentity + "-" + (i + 1);
            Trigger uploadTrigger = TriggerBuilder.newTrigger()
                    .withIdentity(triggerId)
                    .forJob(uploadJob)
                    .withSchedule(CronScheduleBuilder.cronSchedule(cronExpressions.get(i)))
                    .build();
            uploadTriggers.add(uploadTrigger);
        }

        if (scheduler.checkExists(uploadJob.getKey())) {
            scheduler.deleteJob(uploadJob.getKey());
        }
        Set<Trigger> triggerSet = new HashSet<>(uploadTriggers);
        scheduler.scheduleJob(uploadJob, triggerSet, true);
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

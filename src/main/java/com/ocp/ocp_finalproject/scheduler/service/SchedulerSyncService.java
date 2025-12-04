package com.ocp.ocp_finalproject.scheduler.service;

import com.ocp.ocp_finalproject.scheduler.job.BlogUploadJob;
import com.ocp.ocp_finalproject.scheduler.job.ContentGenerationJob;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.util.RecurrenceRuleCronConverter;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import lombok.RequiredArgsConstructor;
import org.quartz.*;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SchedulerSyncService {

    private static final Duration CONTENT_JOB_OFFSET = Duration.ofHours(-1);

    private final Scheduler scheduler;

    public void startSchedulerIfNeeded() throws SchedulerException {
        if (!scheduler.isStarted()) {
            scheduler.start();  // 스케줄러 시작
        }
    }

    public void registerWorkflowJobs(Workflow workflow) throws SchedulerException {

        // 1. 콘텐츠 생성 Job/Trigger 생성 (블로그 업로드보다 1시간 빠르게 실행)
        JobDetail contentJob = JobBuilder.newJob(ContentGenerationJob.class)
                .withIdentity("content-generate-" + workflow.getId())
                .usingJobData("workflowId", workflow.getId())
                .storeDurably()
                .build();

        List<String> contentCronExpressions = RecurrenceRuleCronConverter
                .toCronExpressionsWithOffset(workflow.getRecurrenceRule(), CONTENT_JOB_OFFSET);
        if (contentCronExpressions.isEmpty()) {
            throw new IllegalStateException("콘텐츠 생성 Cron 표현식을 하나 이상 생성해야 합니다.");
        }
        List<Trigger> contentTriggers = buildTriggers(
                contentJob,
                contentCronExpressions,
                "content-generate-trigger-" + workflow.getId()
        );
        if (scheduler.checkExists(contentJob.getKey())) {
            scheduler.deleteJob(contentJob.getKey());
        }
        scheduler.scheduleJob(contentJob, new HashSet<>(contentTriggers), true);

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
        List<Trigger> uploadTriggers = buildTriggers(
                uploadJob,
                cronExpressions,
                "blog-upload-trigger-" + workflow.getId()
        );

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
            scheduler.deleteJob(new JobKey("content-generate-" + workflowId));
            scheduler.deleteJob(new JobKey("blog-upload-" + workflowId));
        } catch (SchedulerException e) {
            throw new IllegalStateException(e);
        }
    }

    private List<Trigger> buildTriggers(JobDetail job, List<String> cronExpressions, String baseTriggerKey) {
        List<Trigger> triggers = new ArrayList<>();
        for (int i = 0; i < cronExpressions.size(); i++) {
            String triggerId = cronExpressions.size() == 1 ? baseTriggerKey : baseTriggerKey + "-" + (i + 1);
            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity(triggerId)
                    .forJob(job)
                    .withSchedule(CronScheduleBuilder.cronSchedule(cronExpressions.get(i)))
                    .build();
            triggers.add(trigger);
        }
        return triggers;
    }
}

package com.ocp.ocp_finalproject.scheduler.blog;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class BlogUploadSchedulerService {

    private static final String JOB_NAME = "blogUploadJob";
    private static final String JOB_GROUP = "blogUpload";
    private static final String TRIGGER_NAME = "blogUploadTrigger";

    private final Scheduler scheduler;

    public void schedule(String cronExpression) {
        try {
            JobDetail jobDetail = JobBuilder.newJob(BlogUploadJob.class)
                    .withIdentity(JOB_NAME, JOB_GROUP)
                    .storeDurably()
                    .build();

            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity(TRIGGER_NAME, JOB_GROUP)
                    .withSchedule(CronScheduleBuilder.cronSchedule(cronExpression))
                    .build();

            if (scheduler.checkExists(jobDetail.getKey())) {
                scheduler.deleteJob(jobDetail.getKey());
            }

            scheduler.scheduleJob(jobDetail, trigger);
            log.info("블로그 업로드 잡을 스케줄링했습니다. cron={}", cronExpression);
        } catch (SchedulerException e) {
            throw new IllegalStateException("블로그 업로드 잡 스케줄링에 실패했습니다.", e);
        }
    }

    public void triggerOnce() {
        try {
            JobKey jobKey = JobKey.jobKey(JOB_NAME, JOB_GROUP);
            if (!scheduler.checkExists(jobKey)) {
                log.warn("등록된 블로그 업로드 잡이 없어 즉시 실행할 수 없습니다.");
                return;
            }
            scheduler.triggerJob(jobKey);
            log.info("블로그 업로드 잡을 즉시 실행했습니다.");
        } catch (SchedulerException e) {
            throw new IllegalStateException("블로그 업로드 잡 즉시 실행에 실패했습니다.", e);
        }
    }

    public void unschedule() {
        try {
            TriggerKey triggerKey = TriggerKey.triggerKey(TRIGGER_NAME, JOB_GROUP);
            scheduler.unscheduleJob(triggerKey);
            log.info("블로그 업로드 잡 트리거를 해제했습니다.");
        } catch (SchedulerException e) {
            throw new IllegalStateException("블로그 업로드 잡 트리거 해제에 실패했습니다.", e);
        }
    }
}

package com.ocp.ocp_finalproject.scheduler.init;

import com.ocp.ocp_finalproject.scheduler.service.SchedulerSyncService;
import com.ocp.ocp_finalproject.workflow.domain.Workflow;
import com.ocp.ocp_finalproject.workflow.repository.WorkflowRepository;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class QuartzInitializer implements ApplicationListener<ApplicationReadyEvent> {

    private final WorkflowRepository workflowRepository;
    private final SchedulerSyncService schedulerSyncService;

    @SneakyThrows
    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        //List<Workflow> workflows = workflowRepository.findAllActive();
        //workflows.forEach(schedulerSyncService::registerWorkflowJobs);
    }
}

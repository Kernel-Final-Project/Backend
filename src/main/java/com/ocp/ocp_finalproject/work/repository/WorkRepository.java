package com.ocp.ocp_finalproject.work.repository;

import com.ocp.ocp_finalproject.work.domain.Work;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WorkRepository extends JpaRepository<Work, Long> {
}

package com.ocp.ocp_finalproject.content.repository;

import com.ocp.ocp_finalproject.content.domain.AiContent;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AiContentRepository extends JpaRepository<AiContent, Long> {

    Optional<AiContent> findTopByWorkId(Long workId);

    List<AiContent> findByWorkIdIn(Collection<Long> workIds);

    Optional<AiContent> findByWorkId(Long workId);
}

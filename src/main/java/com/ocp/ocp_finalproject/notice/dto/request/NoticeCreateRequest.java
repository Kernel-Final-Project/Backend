package com.ocp.ocp_finalproject.notice.dto.request;

import com.ocp.ocp_finalproject.notice.domain.Notice;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class NoticeCreateRequest {

    private String title;
    private String content;
    private String announcementType;
    private Boolean isImportant;
    private Long authorId;

    private List<NoticeFileCreateRequest> noticeFiles;

    public Notice toEntity() {
        return Notice.createBuilder()
                .title(title)
                .content(content)
                .announcementType(announcementType)
                .isImportant(isImportant)
                .authorId(authorId)
                .build();
    }
}

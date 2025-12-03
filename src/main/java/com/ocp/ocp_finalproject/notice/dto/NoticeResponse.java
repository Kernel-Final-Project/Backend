package com.ocp.ocp_finalproject.notice.dto;

import com.ocp.ocp_finalproject.notice.damain.Notice;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Builder
public class NoticeResponse {
    private Long noticeId;
    private String title;
    private String content;
    private String announcementType;
    private Boolean isImportant;
    private Long authorId;
    private Integer viewCount;
    private String attachmentUrl;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;


    private List<NoticeFileResponse> noticeFiles;

    public static NoticeResponse from(Notice notice) {
        return NoticeResponse.builder()
                .noticeId(notice.getId())
                .title(notice.getTitle())
                .content(notice.getContent())
                .announcementType(notice.getAnnouncementType())
                .isImportant(notice.getIsImportant())
                .authorId(notice.getAuthorId())
                .viewCount(notice.getViewCount())
                .attachmentUrl(notice.getAttachmentUrl())
                .createdAt(notice.getCreatedAt())
                .updatedAt(notice.getUpdatedAt())
                .noticeFiles(
                        notice.getNoticeFiles().stream()
                                .map(NoticeFileResponse::from)
                                .toList()
                )
                .build();
    }
}

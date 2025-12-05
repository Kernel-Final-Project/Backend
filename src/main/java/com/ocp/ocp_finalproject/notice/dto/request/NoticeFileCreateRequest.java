package com.ocp.ocp_finalproject.notice.dto.request;

import com.ocp.ocp_finalproject.notice.domain.Notice;
import com.ocp.ocp_finalproject.notice.domain.NoticeFile;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class NoticeFileCreateRequest {

    private String fileName;
    private String originalName;
    private String fileUrl;
    private String fileType;
    private Long fileSize;

    public NoticeFile toEntity(Notice notice) {
        return NoticeFile.createBuilder()
                .notice(notice)
                .fileName(fileName)
                .originalName(originalName)
                .fileUrl(fileUrl)
                .fileType(fileType)
                .fileSize(fileSize)
                .build();
    }
}

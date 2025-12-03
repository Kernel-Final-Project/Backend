package com.ocp.ocp_finalproject.notice.dto;

import com.ocp.ocp_finalproject.notice.damain.NoticeFile;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class NoticeFileResponse {
    private Long fileId;
    private String fileName;
    private String originalName;
    private String fileUrl;
    private Long fileSize;
    private String fileType;

    public static NoticeFileResponse from(NoticeFile file) {
        if(file == null) {
            return null;
        }

        return NoticeFileResponse.builder()
                .fileId(file.getId())
                .fileName(file.getFileName())
                .originalName(file.getOriginalName())
                .fileUrl(file.getFileUrl())
                .fileType(file.getFileType())
                .build();
    }
}

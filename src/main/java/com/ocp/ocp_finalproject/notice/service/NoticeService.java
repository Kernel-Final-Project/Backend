package com.ocp.ocp_finalproject.notice.service;

import com.ocp.ocp_finalproject.notice.dto.NoticeResponse;

import java.util.List;

public interface NoticeService {

    /**
     * 공지사항 + 첨부파일 목록 조회
     */
    List<NoticeResponse> getAllNotice();
}

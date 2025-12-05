package com.ocp.ocp_finalproject.notice.service;

import com.ocp.ocp_finalproject.notice.dto.request.NoticeCreateRequest;
import com.ocp.ocp_finalproject.notice.dto.response.NoticeResponse;

import java.util.List;

public interface NoticeService {

    /**
     * 공지사항 + 첨부파일 목록 조회
     */
    List<NoticeResponse> getAllNotice();

    /**
     * 공지사항 상세 조회
     */
    NoticeResponse getNotice(Long noticeId);

    /**
     * 공지사항 등록
     */
    NoticeResponse createNotice(NoticeCreateRequest request);
}

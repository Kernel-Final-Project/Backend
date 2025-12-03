package com.ocp.ocp_finalproject.notice.api.user;

import com.ocp.ocp_finalproject.notice.dto.NoticeResponse;
import com.ocp.ocp_finalproject.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/notices")
public class NoticeController {

    private final NoticeService noticeService;

    /**
     * 공지사항 목록 조회
     */

    @GetMapping
    public ResponseEntity<List<NoticeResponse>> getAllNotices() {

        List<NoticeResponse> responses = noticeService.getAllNotice();

        return ResponseEntity.ok(responses);
    }


}

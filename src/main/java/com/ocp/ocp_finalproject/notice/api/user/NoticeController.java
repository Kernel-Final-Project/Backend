package com.ocp.ocp_finalproject.notice.api.user;

import com.ocp.ocp_finalproject.common.response.ApiResponse;
import com.ocp.ocp_finalproject.notice.dto.response.NoticeResponse;
import com.ocp.ocp_finalproject.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
    public ResponseEntity<ApiResponse<List<NoticeResponse>>> getAllNotices() {
        return ResponseEntity.ok(ApiResponse.success("공지사항 목록 조회 성공", noticeService.getAllNotice()));
    }
    /**
     * 공지사항 상세 조회
     */
    @GetMapping("/{noticeId}")
    public ResponseEntity<ApiResponse<NoticeResponse>> getNotice(
            @PathVariable Long noticeId
    ) {
        return ResponseEntity.ok(ApiResponse.success("공지사항 조회 성공", noticeService.getNotice(noticeId)));
    }

}

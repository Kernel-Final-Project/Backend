package com.ocp.ocp_finalproject.notice.controller.admin;

import com.ocp.ocp_finalproject.common.response.ApiResult;
import com.ocp.ocp_finalproject.notice.dto.request.NoticeCreateRequest;
import com.ocp.ocp_finalproject.notice.dto.request.NoticeUpdateRequest;
import com.ocp.ocp_finalproject.notice.dto.response.NoticeResponse;
import com.ocp.ocp_finalproject.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/admin/notices")
public class NoticeAdminController {

    private final NoticeService noticeService;

    /**
     * 공지사항 목록 조회 (관리자용)
     */
    @GetMapping
    public ResponseEntity<ApiResult<List<NoticeResponse>>> getAllNotices() {
        return ResponseEntity.ok(ApiResult.success("공지사항 목록 조회 성공", noticeService.getAllNotice()));
    }

    /**
     * 공지사항 등록
     */
    @PostMapping
    public ResponseEntity<ApiResult<NoticeResponse>> createNotice(@RequestBody NoticeCreateRequest request) {
        return ResponseEntity.ok(ApiResult.success("공지사항 등록 성공", noticeService.createNotice(request))
        );
    }

    /**
     * 공지사항 삭제
     */
    @DeleteMapping("/{noticeId}")
    public ResponseEntity<ApiResult<Void>> deleteNotice(@PathVariable Long noticeId) {
        noticeService.deleteNotice(noticeId);
        return ResponseEntity.ok(ApiResult.success("공지사항 삭제 성공", null)
        );
    }
    /**
     * 공지사항 수정
     */
    @PatchMapping("/{noticeId}")
    public ResponseEntity<ApiResult<NoticeResponse>> updateNotice(
            @PathVariable Long noticeId,
            @RequestBody NoticeUpdateRequest request
    ) {
        return ResponseEntity.ok(
                ApiResult.success("공지사항 수정 성공", noticeService.updateNotice(noticeId, request))
        );
    }
}

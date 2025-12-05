package com.ocp.ocp_finalproject.notice.controller.admin;

import com.ocp.ocp_finalproject.common.response.ApiResult;
import com.ocp.ocp_finalproject.notice.dto.request.NoticeCreateRequest;
import com.ocp.ocp_finalproject.notice.dto.response.NoticeResponse;
import com.ocp.ocp_finalproject.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/admin/notices")
public class NoticeAdminController {

    private final NoticeService noticeService;

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
}

package com.ocp.ocp_finalproject.notice.api.admin;

import com.ocp.ocp_finalproject.common.response.ApiResponse;
import com.ocp.ocp_finalproject.notice.dto.request.NoticeCreateRequest;
import com.ocp.ocp_finalproject.notice.dto.response.NoticeResponse;
import com.ocp.ocp_finalproject.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/admin/notices")
public class NoticeAdminController {

    private final NoticeService noticeService;

    /**
     * 공지사항 등록
     */
    @PostMapping
    public ResponseEntity<ApiResponse<NoticeResponse>> createNotice(@RequestBody NoticeCreateRequest request) {
        return ResponseEntity.ok(ApiResponse.success("공지사항 등록 성공", noticeService.createNotice(request))
        );
    }
}

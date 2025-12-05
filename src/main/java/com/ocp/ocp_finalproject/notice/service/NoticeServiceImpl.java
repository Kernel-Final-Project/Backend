package com.ocp.ocp_finalproject.notice.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.notice.domain.Notice;
import com.ocp.ocp_finalproject.notice.domain.NoticeFile;
import com.ocp.ocp_finalproject.notice.dto.request.NoticeCreateRequest;
import com.ocp.ocp_finalproject.notice.dto.response.NoticeResponse;
import com.ocp.ocp_finalproject.notice.repository.NoticeFileRepository;
import com.ocp.ocp_finalproject.notice.repository.NoticeRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeRepository noticeRepository;
    private final NoticeFileRepository noticeFileRepository;

    @Override
    public List<NoticeResponse> getAllNotice() {

        return noticeRepository.findAllWithFiles().stream()
                .map(NoticeResponse::from)
                .toList();
    }

    @Override
    public NoticeResponse getNotice(Long noticeId) {
        Notice notice = noticeRepository.findByIdWithFiles(noticeId)
                .orElseThrow(() -> new CustomException(ErrorCode.NOTICE_NOT_FOUND));

        return NoticeResponse.from(notice);
    }

    @Override
    @Transactional
    public NoticeResponse createNotice(NoticeCreateRequest request) {

        // 1. 공지사항 엔티티 생성
        Notice notice = request.toEntity();

        // 2. 공지사항 저장
        Notice savedNotice = noticeRepository.save(notice);

        // 3. 첨부파일이 있는 경우 NoticeFile 엔티티 생성 + 저장
        if (request.getNoticeFiles() != null && !request.getNoticeFiles().isEmpty()) {

            List<NoticeFile> fileEntities = request.getNoticeFiles().stream()
                    .map(fileReq -> fileReq.toEntity(savedNotice))
                    .toList();

            noticeFileRepository.saveAll(fileEntities);
        }

        // 4. 저장된 Notices -> DTO 변환 후 반환
        return NoticeResponse.from(savedNotice);
    }


}

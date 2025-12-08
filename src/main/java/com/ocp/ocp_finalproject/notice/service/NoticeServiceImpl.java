package com.ocp.ocp_finalproject.notice.service;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.notice.domain.Notice;
import com.ocp.ocp_finalproject.notice.domain.NoticeFile;
import com.ocp.ocp_finalproject.notice.dto.request.NoticeCreateRequest;
import com.ocp.ocp_finalproject.notice.dto.request.NoticeUpdateRequest;
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

    /**
     * 공지사항 등록
     */
    @Override
    @Transactional
    public NoticeResponse createNotice(NoticeCreateRequest request) {

        // 1. 공지사항 엔티티 생성
        Notice notice = request.toEntity();

        // 2. 공지사항 저장
        Notice savedNotice = noticeRepository.save(notice);

        // 3. 첨부파일이 있는 경우 NoticeFile 엔티티 생성 + 저장
        if (request.getFileName() != null) {
            NoticeFile file = NoticeFile.create(
                    savedNotice,
                    request.getFileName(),
                    request.getFileName(), // originalName 동일 처리
                    request.getFileUrl(),
                    request.getFileSize(),
                    request.getFileType()
            );

            noticeFileRepository.save(file);
            savedNotice.addNoticeFile(file);

        }
        // 4. 저장된 Notices -> DTO 변환 후 반환
        return NoticeResponse.from(savedNotice);
    }
    /**
     * 공지사항 삭제
     */
    @Override
    @Transactional
    public void deleteNotice(Long noticeId) {

        // 1. 공지 + 파일까지 fetch join으로 조회
        Notice notice = noticeRepository.findByIdWithFiles(noticeId)
                .orElseThrow(() -> new CustomException(ErrorCode.NOTICE_NOT_FOUND));

        // 2. 삭제 (Cascade + orphanRemoval 로 파일도 함께 삭제)
        noticeRepository.delete(notice);
    }

    /**
     * 공지사항 수정
     */
    @Override
    @Transactional
    public NoticeResponse updateNotice(Long noticeId, NoticeUpdateRequest request) {

        Notice notice = noticeRepository.findByIdWithFiles(noticeId)
                .orElseThrow(() -> new CustomException(ErrorCode.NOTICE_NOT_FOUND));

        // 1. 텍스트 필드 수정 (null인 값은 무시)
        notice.update(
                request.getTitle(),
                request.getContent(),
                request.getAnnouncementType(),
                request.getIsImportant()
        );

        // 2. 파일 수정 (client가 파일 관련 정보 하나라도 전달하면 전체 교체)
        boolean hasFileUpdate =
                request.getFileName() != null &&
                        request.getFileUrl() != null;

        if (hasFileUpdate) {
            // 기존 파일 전체 삭제
            notice.getNoticeFiles().clear();

            NoticeFile.create(
                    notice,
                    request.getFileName(),
                    request.getFileName(),  // originalName 동일 처리
                    request.getFileUrl(),
                    request.getFileSize(),
                    request.getFileType()
            );
        }

        return NoticeResponse.from(notice);
    }
}

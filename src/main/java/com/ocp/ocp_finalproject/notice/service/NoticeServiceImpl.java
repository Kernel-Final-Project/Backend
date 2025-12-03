package com.ocp.ocp_finalproject.notice.service;

import com.ocp.ocp_finalproject.notice.damain.Notice;
import com.ocp.ocp_finalproject.notice.dto.NoticeResponse;
import com.ocp.ocp_finalproject.notice.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeRepository noticeRepository;

    @Override
    public List<NoticeResponse> getAllNotice() {

        List<Notice> notices = noticeRepository.findAllWithFiles();

        return notices.stream()
                .map(NoticeResponse::from)
                .toList();
    }


}

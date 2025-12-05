package com.ocp.ocp_finalproject.controller;

import com.ocp.ocp_finalproject.common.exception.CustomException;
import com.ocp.ocp_finalproject.common.exception.ErrorCode;
import com.ocp.ocp_finalproject.common.response.ApiResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class TestController {

    // 에러 테스트용
    @GetMapping("/error")
    public String testError() {
        throw new CustomException(ErrorCode.USER_NOT_FOUND);
    }

    // 성공 응답 테스트용
    @GetMapping("/success")
    public ApiResult<String> testSuccess() {
        return ApiResult.success("테스트 성공!");
    }
}
package com.ocp.ocp_finalproject.common.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ApiResponse<T> {

    //성공 여부(true/false)
    private boolean success;

    //message: 응답 메시지 (예: "조회 성공", "등록 완료")
    private String message;

    //조회 결과, 생성된 객체 등 다양한 타입의 데이터를 담을 수 있음
    private T data;

    //성공 응답 (데이터 O)
    public static <T> ApiResponse<T> success(String message, T data) {
        return new ApiResponse<>(true, message, data);
    }

    //성공 응답 (데이터 x)
    public static <T> ApiResponse<T> success(String message) {
        return new ApiResponse<>(true, message, null);
    }

    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(false, message, null);
    }

}

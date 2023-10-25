package com.flab.tabling.global.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import lombok.extern.slf4j.Slf4j;

/**
 * @RestControllerAdvice : 흩어져 있는 exception handler를 단 하나의 전역 컴포넌트에 통합시킬 수 있게 한다.
 * @ExceptionHandler : @Controller, @RestController가 적용된 빈에서 발생한 예외를 잡아서 하나의 메소드에서
 * 처리해주는 기능
 * @Sl4fj : simple loggin facade for Java, logger 필드에 대한 롬복 어노테이션
 */

@Slf4j
@RestControllerAdvice
public class GlobalExceptionAdvice {
	@ExceptionHandler(BusinessException.class)
	public ResponseEntity<ErrorResponse> handleBusinessException(BusinessException e) {
		return createErrorResponse(e, e.getErrorCode());
	}

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<ErrorResponse> handleInvalidParameterException(MethodArgumentNotValidException e) {
		return createErrorResponse(e, ErrorCode.INVALID_PARAMETER);
	}

	private ResponseEntity<ErrorResponse> createErrorResponse(Exception e, ErrorCode errorCode) {
		log.warn(e.getClass().getName(), e);
		ErrorResponse errorResponse = ErrorResponse.builder()
			.code(errorCode)
			.message(e.getMessage())
			.build();
		return ResponseEntity
			.status(errorCode.getStatus())
			.body(errorResponse);
	}

}

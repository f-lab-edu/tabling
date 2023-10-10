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
 */

@Slf4j
@RestControllerAdvice
public class GlobalExceptionAdvice {
	@ExceptionHandler(BusinessException.class)
	public ResponseEntity<ErrorResponse> handleBusinessException(BusinessException e) {
		log.warn(e.getClass().getName(), e);
		ErrorResponse errorResponse = ErrorResponse.builder()
			.message(e.getMessage())
			.code(e.getErrorCode())
			.build();
		return ResponseEntity
			.status(e.getErrorCode().getStatus())
			.body(errorResponse);
	}

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<ErrorResponse> handleInvalidParameterException(MethodArgumentNotValidException e) {
		log.warn(e.getClass().getName(), e);
		InvalidParameterException ex = new InvalidParameterException(e);
		ErrorResponse errorResponse = ErrorResponse.builder()
			.message(ex.getMessage())
			.code(ex.getErrorCode())
			.build();
		return ResponseEntity
			.status(ex.getErrorCode().getStatus())
			.body(errorResponse);
	}

}

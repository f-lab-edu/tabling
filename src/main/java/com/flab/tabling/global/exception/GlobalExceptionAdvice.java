package com.flab.tabling.global.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @RestControllerAdvice : 흩어져 있는 exception handler를 단 하나의 전역 컴포넌트에 통합시킬 수 있게 한다.
 * @ExceptionHandler : @Controller, @RestController가 적용된 빈에서 발생한 예외를 잡아서 하나의 메소드에서
 * 처리해주는 기능
 */

@RestControllerAdvice
public class GlobalExceptionAdvice {
	private final String invalidParameterCode = "INVALID_PARAMETER";
	private final String invalidParameterMessage = " is invalid";

	@ExceptionHandler(BusinessException.class)
	public ResponseEntity<ErrorResponse> handleBusinessException(BusinessException e) {
		ErrorResponse errorResponse = ErrorResponse.builder()
			.message(e.getMessage())
			.code(e.getErrorCode().name())
			.build();
		return ResponseEntity
			.status(e.getErrorCode().getStatus())
			.body(errorResponse);
	}

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<ErrorResponse> handleException(MethodArgumentNotValidException e) {
		FieldError fieldError = e.getBindingResult().getFieldErrors().get(0);
		ErrorResponse errorResponse = ErrorResponse.builder()
			.message(fieldError.getField() + invalidParameterMessage)
			.code(invalidParameterCode)
			.build();
		return ResponseEntity
			.status(HttpStatus.BAD_REQUEST)
			.body(errorResponse);
	}

}

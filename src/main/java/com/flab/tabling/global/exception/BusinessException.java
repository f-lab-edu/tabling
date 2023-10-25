package com.flab.tabling.global.exception;

import lombok.Getter;

@Getter
public class BusinessException extends RuntimeException {
	//TODO: 예외 발생

	private final ErrorCode errorCode;

	public BusinessException(ErrorCode errorCode, String message) {
		super(message);
		this.errorCode = errorCode;
	}
}

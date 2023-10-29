package com.flab.tabling.global.exception;

import lombok.Getter;

@Getter
public class BusinessException extends RuntimeException {
	//TODO: 예외 발생

	private final ErrorCode errorCode;

	public BusinessException(ErrorCode errorCode) {
		super(errorCode.getMessage());
		this.errorCode = errorCode;
	}

	public BusinessException(ErrorCode errorCode, Throwable cause) {
		super(errorCode.getMessage(), cause);
		this.errorCode = errorCode;
	}
}

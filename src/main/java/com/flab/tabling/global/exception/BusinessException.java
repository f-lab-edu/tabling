package com.flab.tabling.global.exception;

import lombok.Getter;

@Getter
public class BusinessException extends RuntimeException {
	private static final String DEFAULT_MESSAGE = "common business exception occurs";
	private final ErrorCode errorCode;

	public BusinessException(ErrorCode errorCode, String message) {
		super(message);
		this.errorCode = errorCode;
	}
}

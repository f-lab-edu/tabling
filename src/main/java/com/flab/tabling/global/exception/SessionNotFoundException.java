package com.flab.tabling.global.exception;

public class SessionNotFoundException extends BusinessException {
	public SessionNotFoundException(ErrorCode errorCode, String message) {
		super(errorCode, message);
	}
}

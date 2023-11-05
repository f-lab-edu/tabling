package com.flab.tabling.global.exception;

public class AuthorizationException extends BusinessException{
	public AuthorizationException(ErrorCode errorCode, String message) {
		super(errorCode, message);
	}
}

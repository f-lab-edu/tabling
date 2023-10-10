package com.flab.tabling.global.exception;

public class InvalidParameterException extends BusinessException {
	public InvalidParameterException(Throwable cause) {
		super(ErrorCode.INVALID_PARAMETER, cause);
	}
}

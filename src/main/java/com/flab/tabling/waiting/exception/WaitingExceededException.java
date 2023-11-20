package com.flab.tabling.waiting.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class WaitingExceededException extends BusinessException {
	public WaitingExceededException(ErrorCode errorCode, String message) {
		super(errorCode, message);
	}
}

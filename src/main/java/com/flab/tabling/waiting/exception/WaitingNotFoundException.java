package com.flab.tabling.waiting.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class WaitingNotFoundException extends BusinessException {
	public WaitingNotFoundException(ErrorCode errorCode, String message) {
		super(errorCode, message);
	}
}

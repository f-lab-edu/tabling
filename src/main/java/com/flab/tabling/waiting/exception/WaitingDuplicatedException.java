package com.flab.tabling.waiting.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class WaitingDuplicatedException extends BusinessException {
	public WaitingDuplicatedException(ErrorCode errorCode, String message) {
		super(errorCode, message);
	}
}

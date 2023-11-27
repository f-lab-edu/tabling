package com.flab.tabling.businesshour.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class BusinessHourNotFoundException extends BusinessException {
	public BusinessHourNotFoundException(ErrorCode errorCode, String message) {
		super(errorCode, message);
	}
}

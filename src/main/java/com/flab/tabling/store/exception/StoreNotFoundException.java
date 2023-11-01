package com.flab.tabling.store.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class StoreNotFoundException extends BusinessException {
	public StoreNotFoundException(ErrorCode errorCode, String message) {
		super(errorCode, message);
	}
}

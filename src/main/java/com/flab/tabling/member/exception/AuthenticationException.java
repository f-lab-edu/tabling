package com.flab.tabling.member.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class AuthenticationException extends BusinessException {
	public AuthenticationException() {
		super(ErrorCode.AUTHENTICATION_FAILED);
	}
}

package com.flab.tabling.member.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class MemberNotFoundException extends BusinessException {
	public MemberNotFoundException(ErrorCode errorCode, String message) { super(errorCode, message); }
}

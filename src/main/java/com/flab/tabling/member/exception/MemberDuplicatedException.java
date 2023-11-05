package com.flab.tabling.member.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class MemberDuplicatedException extends BusinessException {
	public MemberDuplicatedException(ErrorCode errorCode, String message) {
		super(errorCode, message);
	}
}

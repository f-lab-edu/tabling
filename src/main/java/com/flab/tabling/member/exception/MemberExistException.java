package com.flab.tabling.member.exception;

import com.flab.tabling.global.exception.BusinessException;
import com.flab.tabling.global.exception.ErrorCode;

public class MemberExistException extends BusinessException {
	public MemberExistException() {
		super(ErrorCode.MISSING_PARAMETER);
	}
}

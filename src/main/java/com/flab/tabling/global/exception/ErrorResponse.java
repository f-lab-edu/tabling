package com.flab.tabling.global.exception;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ErrorResponse {
	private ErrorCode code;
	private String message;

	public ErrorResponse(ErrorCode code) {
		this.message = code.getMessage();
		this.code = code;
	}

}

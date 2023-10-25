package com.flab.tabling.global.exception;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
public class ErrorResponse {
	private ErrorCode code;
	private String message;

	@Builder
	public ErrorResponse(ErrorCode code, String message) {
		this.message = message;
		this.code = code;
	}

}

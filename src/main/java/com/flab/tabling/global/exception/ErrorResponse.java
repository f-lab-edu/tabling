package com.flab.tabling.global.exception;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ErrorResponse {
	private String message;
	private String code;

	@Builder
	public ErrorResponse(String message, String code) {
		this.message = message;
		this.code = code;
	}

}

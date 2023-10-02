package com.flab.tabling.global.exception;

import lombok.Builder;
import lombok.Getter;

@Getter
public class ErrorResponse {
	private String message;
	private String code;

	@Builder
	public ErrorResponse(String message, String code) {
		this.message = message;
		this.code = code;
	}

}

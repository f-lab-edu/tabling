package com.flab.tabling.global.exception;

import lombok.Getter;

public enum ErrorCode {
	MISSING_PARAMETER("Required Parameter is missing"),
	BAD_FORMAT("Parameter does not comply with a particular format");
	@Getter
	private final String message;

	ErrorCode(String message) {
		this.message = message;
	}
}

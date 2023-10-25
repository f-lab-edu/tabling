package com.flab.tabling.global.exception;

import lombok.Getter;

@Getter
public enum ErrorCode {

	MEMBER_DUPLICATED("member already exists", 400),
	MEMBER_NOT_FOUND("member not found", 404),
	INVALID_PARAMETER("parameter is invalid", 400);

	private final String description;
	private final int status;

	ErrorCode(String description, int status) {
		this.description = description;
		this.status = status;
	}
}

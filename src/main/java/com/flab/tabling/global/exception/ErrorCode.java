package com.flab.tabling.global.exception;

import lombok.Getter;

@Getter
public enum ErrorCode {

	MEMBER_DUPLICATED("member already exists", 400),
	MEMBER_NOT_FOUND("member not found", 404),
	STORE_NOT_FOUND("store not found", 404),
	BUSINESS_HOUR_NOT_FOUND("business hour not found", 404),
	INVALID_SESSION("session is invalid", 400),
	INVALID_PARAMETER("parameter is invalid", 400),
	AUTHENTICATION_FAILED("authentication failed", 401),
	AUTHORIZATION_FAILED("authorization failed", 403);

	private final String description;
	private final int status;

	ErrorCode(String description, int status) {
		this.description = description;
		this.status = status;
	}
}

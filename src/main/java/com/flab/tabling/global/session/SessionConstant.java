package com.flab.tabling.global.session;

import lombok.Getter;

@Getter
public enum SessionConstant {
	MEMBER_ID("member_id");

	private final String key;

	SessionConstant(String key) {
		this.key = key;
	}
}

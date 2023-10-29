package com.flab.tabling.global.util;

import lombok.Getter;

@Getter
public class MemberSessionDto {
	private Long id;
	private String name;

	public MemberSessionDto(Long id, String name) {
		this.id = id;
		this.name = name;
	}
}

package com.flab.tabling.member.dto;

import lombok.Getter;

@Getter
public class MemberSession {
	private Long id;
	private String name;

	public MemberSession(Long id, String name) {
		this.id = id;
		this.name = name;
	}
}

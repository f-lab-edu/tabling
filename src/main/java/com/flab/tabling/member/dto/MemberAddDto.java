package com.flab.tabling.member.dto;

import com.flab.tabling.member.domain.RoleType;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class MemberAddDto {
	@Getter
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	public static class Request {
		@NotNull
		@Size(min = 1, max = 30)
		private String name;
		@NotNull
		@Email
		private String email;
		@NotNull
		private RoleType roleType;
		@NotNull
		@Size(min = 8)
		private String password;

		@Builder
		public Request(String name, String email, RoleType roleType, String password) {
			this.name = name;
			this.email = email;
			this.roleType = roleType;
			this.password = password;
		}
	}

	@Getter
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	public static class Response {
		private Long id;

		public Response(Long id) {
			this.id = id;
		}
	}

}

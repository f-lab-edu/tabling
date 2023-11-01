package com.flab.tabling.member.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class MemberAuthDto {
	@Getter
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	public static class Request {
		@NotNull @Email
		String email;
		@NotNull
		String password;

		@Builder
		public Request(String email, String password) {
			this.email = email;
			this.password = password;
		}
	}

	@Getter
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	public static class Response {
		@NotNull
		private Long id;

		public Response(Long id) {
			this.id = id;
		}
	}
}

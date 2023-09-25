package com.flab.tabling.user.dto;

import com.flab.tabling.user.domain.RoleType;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

public class MemberAddDto {
	@Getter
	public static class Request {
		@NotNull(message = "NO_NICKNAME")
		@Size(min = 1, max = 30, message = "INVALID_NAME")
		private String name;
		@NotNull
		@Email(message = "INVALID_EMAIL")
		private String email;
		@NotNull(message = "NO_ROLE_TYPE")
		private RoleType roleType;
		@NotNull(message = "NO_PASSWORD")
		@Size(min = 8, message = "INVALID_PASSWORD")
		private String password;

		@Builder
		public Request(String name, String email, RoleType roleType, String password) {
			this.name = name;
			this.email = email;
			this.roleType = roleType;
			this.password = password;
		}
	}

}

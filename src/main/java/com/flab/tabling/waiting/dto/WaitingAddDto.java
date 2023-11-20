package com.flab.tabling.waiting.dto;

import com.flab.tabling.member.domain.RoleType;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class WaitingAddDto {
	@Getter
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	public static class Request {
		@NotNull
		@Min(1) @Max(50)
		private Integer headCount;

		public Request(Integer headCount) {
			this.headCount = headCount;
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

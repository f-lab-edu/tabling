package com.flab.tabling.store.dto;

import jakarta.persistence.Lob;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class StoreUpdateDto {

	@Getter
	@NoArgsConstructor(access = AccessLevel.PROTECTED)
	public static class Request {
		@NotNull
		private Long id;
		@NotBlank
		@Size(min = 1, max = 30)
		private String name;
		@NotBlank
		@Size(min = 1, max = 20)
		private String category;
		@Lob
		private String description;
		@NotNull
		@Positive
		@Max(50)
		private Integer maxWaitingCount;

		@Builder
		public Request(Long id, String name, String category, String description, Integer maxWaitingCount) {
			this.id = id;
			this.name = name;
			this.category = category;
			this.description = description;
			this.maxWaitingCount = maxWaitingCount;
		}
	}

	@Getter
	@NoArgsConstructor(access = AccessLevel.PROTECTED)
	public static class Response {
		@NotNull
		private Long id;

		@Builder
		public Response(Long id) {
			this.id = id;
		}
	}
}

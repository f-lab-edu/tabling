package com.flab.tabling.store.dto;

import com.flab.tabling.store.domain.Category;

import jakarta.persistence.Lob;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class StoreAddDto {
	@Getter
	@NoArgsConstructor
	public static class Request {
		@NotBlank
		@Size(min = 1, max = 30)
		private String name;
		private Category category;
		@Lob
		private String description;
		@NotNull
		@Positive
		@Max(50)
		private Integer maxWaitingCount;

		@Builder
		public Request(String name, Category category, String description, Integer maxWaitingCount) {
			this.name = name;
			this.category = category;
			this.description = description;
			this.maxWaitingCount = maxWaitingCount;
		}
	}

	@Getter
	public static class Response {
		@NotNull
		private Long id;

		@Builder
		public Response(Long id) {
			this.id = id;
		}
	}
}

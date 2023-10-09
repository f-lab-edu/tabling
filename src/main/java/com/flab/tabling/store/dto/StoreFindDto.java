package com.flab.tabling.store.dto;

import com.flab.tabling.store.domain.Store;

import jakarta.persistence.Lob;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Getter;

public class StoreFindDto {

	@Getter
	public static class Response {
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
		public Response(Store store) {
			this.name = store.getName();
			this.category = store.getCategory();
			this.description = store.getDescription();
			this.maxWaitingCount = store.getMaxWaitingCount();
		}
	}
}

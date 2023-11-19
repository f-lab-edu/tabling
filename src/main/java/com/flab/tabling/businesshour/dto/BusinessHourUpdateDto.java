package com.flab.tabling.businesshour.dto;

import java.time.DayOfWeek;
import java.time.LocalTime;

import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class BusinessHourUpdateDto {

	@Getter
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	public static class Request {
		@NotNull
		private Long id;
		private DayOfWeek dayOfWeek;
		private LocalTime startTime;
		private LocalTime endTime;
	}

	@Getter
	public static class Response {
		private Long id;

		public Response(Long id) {
			this.id = id;
		}
	}
}

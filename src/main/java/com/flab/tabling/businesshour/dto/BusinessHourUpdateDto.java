package com.flab.tabling.businesshour.dto;

import java.time.DayOfWeek;
import java.time.LocalTime;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class BusinessHourUpdateDto {

	@Getter
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	public static class Request {
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

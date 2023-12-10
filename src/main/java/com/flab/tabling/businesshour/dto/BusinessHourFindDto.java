package com.flab.tabling.businesshour.dto;

import java.time.DayOfWeek;
import java.time.LocalTime;

import com.flab.tabling.businesshour.domain.BusinessHour;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class BusinessHourFindDto {

	@Getter
	@NoArgsConstructor(access = AccessLevel.PRIVATE)
	public static class Request {
		private Long storeId;
		private DayOfWeek dayOfWeek;

		public Request(Long storeId, DayOfWeek dayOfWeek) {
			this.storeId = storeId;
			this.dayOfWeek = dayOfWeek;
		}
	}

	@Getter
	public static class Response {
		private Long storeId;
		private DayOfWeek dayOfWeek;
		private LocalTime startTime;
		private LocalTime endTime;

		public Response(BusinessHour businessHour) {
			this.storeId = businessHour.getStore().getId();
			this.dayOfWeek = businessHour.getDayOfWeek();
			this.startTime = businessHour.getStartTime();
			this.endTime = businessHour.getEndTime();
		}
	}
}

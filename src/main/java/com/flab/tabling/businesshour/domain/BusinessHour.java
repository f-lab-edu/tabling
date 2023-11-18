package com.flab.tabling.businesshour.domain;

import java.time.DayOfWeek;
import java.time.LocalTime;

import com.flab.tabling.store.domain.Store;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class BusinessHour {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "store_id")
	private Store store;
	@Enumerated(value = EnumType.STRING)
	private DayOfWeek dayOfWeek;
	private LocalTime startTime;
	private LocalTime endTime;

	@Builder
	public BusinessHour(Store store, DayOfWeek dayOfWeek, LocalTime startTime, LocalTime endTime) {
		this.store = store;
		this.dayOfWeek = dayOfWeek;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public boolean isBusinessHour(LocalTime requestTime) {
		return !requestTime.isBefore(startTime) && !requestTime.isAfter(endTime);
	}
}

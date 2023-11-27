package com.flab.tabling.businesshour;

import static org.jeasy.random.FieldPredicates.*;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;

import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.store.StoreFixture;
import com.flab.tabling.store.domain.Store;

public class BusinessHourFixture {

	private static final Long ID = 3L;
	private static final int YEAR = 2023;
	private static final int MONTH = 9;
	private static final int DAY_OF_MONTH = 19;
	private static final int MINUTE = 0;

	private StoreFixture storeFixture = FixtureFactory.storeFixture();

	public BusinessHour getBusinessHour(Long storeId, int startTime, int endTime) {
		Store targetStore = storeFixture.getStore(storeId);
		EasyRandomParameters parameters = getCustomParameters(ID, targetStore, getDayOfWeek(), startTime, endTime);
		EasyRandom businessHourRandom = new EasyRandom(parameters);
		return businessHourRandom.nextObject(BusinessHour.class);
	}

	public List<BusinessHour> getBusinessHoursWithBreakTime(Long storeId, int startTime, int breakStartTime,
		int breakEndTime,
		int endTime) {
		List<BusinessHour> businessHours = new ArrayList<>();
		businessHours.add(getBusinessHour(storeId, startTime, breakStartTime));
		businessHours.add(getBusinessHour(storeId, breakEndTime, endTime));
		return businessHours;
	}

	public LocalDateTime getLocalDateTime(int targetTime) {
		return LocalDateTime.of(YEAR, MONTH, DAY_OF_MONTH, targetTime, MINUTE);
	}

	public LocalTime getLocalTime(int targetTime) {
		return LocalTime.of(targetTime, MINUTE);
	}

	public DayOfWeek getDayOfWeek() {
		return LocalDate.of(YEAR, MONTH, DAY_OF_MONTH).getDayOfWeek();
	}

	private EasyRandomParameters getCustomParameters(Long id, Store targetStore, DayOfWeek dayOfWeek, int startTime,
		int endTime) {
		return new EasyRandomParameters()
			.randomize(named("id"), () -> id)
			.randomize(named("store"), () -> targetStore)
			.randomize(named("dayOfWeek"), () -> dayOfWeek)
			.randomize(named("startTime"), () -> getLocalTime(startTime))
			.randomize(named("endTime"), () -> getLocalTime(endTime));
	}
}

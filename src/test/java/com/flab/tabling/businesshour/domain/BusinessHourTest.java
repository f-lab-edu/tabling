package com.flab.tabling.businesshour.domain;

import static org.assertj.core.api.Assertions.*;

import java.time.LocalTime;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;

@ExtendWith(MockitoExtension.class)
class BusinessHourTest {
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();

	@Test
	@DisplayName("요청 시간이 운영 시간이라면 true를 반환한다.")
	void successWithCorrectBusinessHour() {
		//given
		BusinessHour businessHour = businessHourFixture.getBusinessHour(2L, 8, 22);
		LocalTime requestTime = businessHourFixture.getLocalTime(9);

		//when
		boolean result = businessHour.isBusinessHour(requestTime);

		//then
		assertThat(result).isTrue();
	}

	@Test
	@DisplayName("요청 시간이 운영 시간 이전이라면 false를 반환한다.")
	void failWithBeforeBusinessHour() {
		//given
		BusinessHour businessHour = businessHourFixture.getBusinessHour(2L, 8, 22);
		LocalTime requestTime = businessHourFixture.getLocalTime(5);

		//when
		boolean result = businessHour.isBusinessHour(requestTime);

		//then
		assertThat(result).isFalse();
	}

	@Test
	@DisplayName("요청 시간이 운영 시간 이후라면 false를 반환한다.")
	void failWithAfterBusinessHour() {
		//given
		BusinessHour businessHour = businessHourFixture.getBusinessHour(2L, 8, 22);
		LocalTime requestTime = businessHourFixture.getLocalTime(23);

		//when
		boolean result = businessHour.isBusinessHour(requestTime);

		//then
		assertThat(result).isFalse();
	}
}

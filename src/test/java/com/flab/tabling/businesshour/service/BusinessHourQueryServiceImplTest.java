package com.flab.tabling.businesshour.service;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.repository.BusinessHourRepository;

@ExtendWith(MockitoExtension.class)
class BusinessHourQueryServiceImplTest {
	@InjectMocks
	private BusinessHourQueryServiceImpl businessHourQueryServiceImpl;
	@Mock
	private BusinessHourRepository businessHourRepository;
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();

	@Test
	@DisplayName("식당 id로 운영 시간 도메인 조회에 성공한다.")
	void getStoreSuccessWithStoreId() {

	}

	@Test
	@DisplayName("식당 id로 운영 시간 도메인 조회에 실패하면 예외가 발생한다.")
	void getStoreFailWithStoreId() {

	}

	@Test
	@DisplayName("식당 id로 운영 시간 dto 조회에 성공하면 해당 식당의 모든 운영 시간을 반환한다.")
	void findSuccessWithStoreId() {
		//given
		List<BusinessHour> businessHours = businessHourFixture.getBusinessHoursWithBreakTime(2L, 8, 15, 18, 22);

		doReturn(businessHours).when(businessHourRepository)
			.findList(2L);

		//when
		List<BusinessHourFindDto.Response> businessHourFindResponses = businessHourQueryServiceImpl.find(2L);

		//then
		assertThat(businessHours.size()).isEqualTo(businessHourFindResponses.size());
	}

	@Test
	@DisplayName("요청한 시간이 운영 시간이 맞다면 true를 반환한다.")
	void findSuccessWithCorrectBusinessHour() {
		//given
		LocalDateTime requestDateTime = businessHourFixture.getLocalDateTime(9);
		List<BusinessHour> targetBusinessHours = businessHourFixture.getBusinessHoursWithBreakTime(2L, 8, 15, 18, 22);

		doReturn(targetBusinessHours).when(businessHourRepository)
			.findList(2L, requestDateTime.getDayOfWeek());

		//when
		boolean result = businessHourQueryServiceImpl.isBusinessHour(2L, requestDateTime);

		//then
		assertThat(result).isTrue();
	}

	@Test
	@DisplayName("요청한 시간이 운영 시간이 아니라면 false를 반환한다.")
	void failWithIncorrectBusinessHour() {
		//given
		LocalDateTime requestDateTime = businessHourFixture.getLocalDateTime(16);
		List<BusinessHour> targetBusinessHours = businessHourFixture.getBusinessHoursWithBreakTime(2L, 8, 15, 18, 22);

		doReturn(targetBusinessHours).when(businessHourRepository)
			.findList(2L, requestDateTime.getDayOfWeek());

		//when
		boolean result = businessHourQueryServiceImpl.isBusinessHour(2L, requestDateTime);

		//then
		assertThat(result).isFalse();
	}

	@Test
	@DisplayName("요청 조건에 대한 운영 시간이 존재하지 않으면 false를 반환한다.")
	void failWithEmptyList() {
		//given
		LocalDateTime requestDateTime = businessHourFixture.getLocalDateTime(12);

		doReturn(List.of()).when(businessHourRepository).findList(2L, requestDateTime.getDayOfWeek());

		//when
		boolean result = businessHourQueryServiceImpl.isBusinessHour(2L, requestDateTime);

		//then
		assertThat(result).isFalse();
	}
}

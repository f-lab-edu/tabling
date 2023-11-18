package com.flab.tabling.businesshour.service;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.exception.BusinessHourNotFoundException;
import com.flab.tabling.businesshour.repository.BusinessHourDynamicQueryRepository;
import com.flab.tabling.businesshour.repository.BusinessHourRepository;

@ExtendWith(MockitoExtension.class)
class BusinessHourQueryServiceImplTest {
	@InjectMocks
	private BusinessHourQueryServiceImpl businessHourQueryServiceImpl;
	@Mock
	private BusinessHourRepository businessHourRepository;
	@Mock
	private BusinessHourDynamicQueryRepository businessHourDynamicQueryRepository;
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();

	@Test
	@DisplayName("운영 시간 단건 조회에 성공하면 응답 Dto를 반환한다.")
	void successWithCorrectId() {
		//given
		BusinessHour businessHour = businessHourFixture.getBusinessHour(2L, 9, 15);
		Long targetId = businessHour.getId();

		doReturn(Optional.ofNullable(businessHour)).when(businessHourRepository).findById(targetId);

		//when
		BusinessHourFindDto.Response businessHourFindResponse = businessHourQueryServiceImpl.findBusinessHour(targetId);

		//then
		assertThat(businessHourFindResponse).usingRecursiveComparison().isEqualTo(
			new BusinessHourFindDto.Response(businessHour));
	}

	@Test
	@DisplayName("존재하지 않는 id로 조회한다면 예외가 발생한다.")
	void failWithNotFoundException() {
		//given
		doReturn(Optional.empty()).when(businessHourRepository).findById(2L);

		//expected
		assertThrows(BusinessHourNotFoundException.class, () -> businessHourQueryServiceImpl.findBusinessHour(2L));
	}

	@Test
	@DisplayName("페이지 조건에 맞는 운영 시간 조회에 성공하면 dto 페이지를 반환한다.")
	void successWithStoreIdAndDayOfWeek() {
		//given
		DayOfWeek requestDayOfWeek = businessHourFixture.getDayOfWeek();
		BusinessHourFindDto.Request businessHourFindRequest = new BusinessHourFindDto.Request(2L, requestDayOfWeek);
		Page<BusinessHour> businessHourPage = businessHourFixture.getBusinessHourPageWithOneStore(2L);
		Pageable requestPageable = businessHourPage.getPageable();

		doReturn(businessHourPage).when(businessHourDynamicQueryRepository)
			.findBusinessHours(2L, requestDayOfWeek, requestPageable);

		//when
		Page<BusinessHourFindDto.Response> businessHourFindResponsePage = businessHourQueryServiceImpl
			.findBusinessHours(businessHourFindRequest, requestPageable);

		//then
		verifyFindResponsePage(businessHourFindResponsePage, businessHourPage);
	}

	@Test
	@DisplayName("요청한 시간이 운영 시간이 맞다면 true를 반환한다.")
	void successWithCorrectBusinessHour() {
		//given
		LocalDateTime requestDateTime = businessHourFixture.getLocalDateTime(9);
		List<BusinessHour> targetBusinessHours = businessHourFixture.getBusinessHoursWithOneStore(2L, 8, 15, 18, 22);

		doReturn(targetBusinessHours).when(businessHourRepository)
			.findBusinessHours(2L, requestDateTime.getDayOfWeek());

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
		List<BusinessHour> targetBusinessHours = businessHourFixture.getBusinessHoursWithOneStore(2L, 8, 15, 18, 22);

		doReturn(targetBusinessHours).when(businessHourRepository)
			.findBusinessHours(2L, requestDateTime.getDayOfWeek());

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

		doReturn(List.of()).when(businessHourRepository).findBusinessHours(2L, requestDateTime.getDayOfWeek());

		//when
		boolean result = businessHourQueryServiceImpl.isBusinessHour(2L, requestDateTime);

		//then
		assertThat(result).isFalse();
	}

	private void verifyFindResponsePage(Page<BusinessHourFindDto.Response> resultBusinessHourPage,
		Page<BusinessHour> businessHourPage) {
		List<BusinessHourFindDto.Response> afterContent = resultBusinessHourPage.getContent();
		List<BusinessHour> beforeContent = businessHourPage.getContent();
		assertThat(afterContent.size()).isEqualTo(beforeContent.size());
		assertThat(afterContent.get(0)).usingRecursiveComparison()
			.isEqualTo(new BusinessHourFindDto.Response(beforeContent.get(0)));
		assertThat(afterContent.get(1)).usingRecursiveComparison()
			.isEqualTo(new BusinessHourFindDto.Response(beforeContent.get(1)));
	}
}

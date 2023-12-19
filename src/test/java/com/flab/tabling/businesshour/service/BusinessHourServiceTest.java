package com.flab.tabling.businesshour.service;

import static org.assertj.core.api.Assertions.*;
import static org.jeasy.random.FieldPredicates.*;
import static org.mockito.Mockito.*;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourAddDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.repository.BusinessHourRepository;
import com.flab.tabling.store.StoreFixture;
import com.flab.tabling.store.domain.Store;

@ExtendWith(MockitoExtension.class)
class BusinessHourServiceTest {

	@InjectMocks
	private BusinessHourService businessHourService;
	@Mock
	private BusinessHourRepository businessHourRepository;
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();
	private StoreFixture storeFixture = FixtureFactory.storeFixture();

	@Test
	@DisplayName("운영 시간 등록에 성공하면 응답을 반환한다.")
	void addSuccess() {
		//given
		BusinessHourAddDto.Request businessHourAddRequest = getBusinessHourAddRequest(2L);
		Store targetStore = storeFixture.getStore(2L, 1L);
		BusinessHour businessHour = businessHourFixture.getBusinessHour(3L, 2L);

		doReturn(businessHour).when(businessHourRepository).save(any(BusinessHour.class));

		//when
		BusinessHourAddDto.Response businessHourAddResponse = businessHourService.add(businessHourAddRequest,
			targetStore);

		//then
		assertThat(businessHourAddResponse.getId()).isEqualTo(3L);
	}

	@Test
	@DisplayName("운영 시간 수정에 성공하면 응답 dto를 반환한다.")
	void updateSuccess() {
		//given
		BusinessHour businessHour = businessHourFixture.getBusinessHour(3L, 2L, 1L);
		BusinessHourUpdateDto.Request businessHourUpdateRequest = getBusinessHourUpdateRequest(3L);

		//when
		BusinessHourUpdateDto.Response businessHourUpdateResponse = businessHourService.update(businessHour,
			businessHourUpdateRequest);

		//then
		assertThat(businessHourUpdateResponse.getId()).isEqualTo(3L);
	}

	@Test
	@DisplayName("운영 시간 삭제에 성공하면 아무런 응답을 반환하지 않는다.")
	void deleteSuccess() {
		//given
		BusinessHour businessHour = businessHourFixture.getBusinessHour(3L, 2L);

		//when
		businessHourService.delete(businessHour);

		//then
		verify(businessHourRepository, times(1)).delete(businessHour);
	}

	private BusinessHourAddDto.Request getBusinessHourAddRequest(Long storeId) {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("storeId"), () -> storeId);
		return new EasyRandom(parameters).nextObject(BusinessHourAddDto.Request.class);
	}

	private BusinessHourUpdateDto.Request getBusinessHourUpdateRequest(Long id) {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("id"), () -> id);
		return new EasyRandom(parameters).nextObject(BusinessHourUpdateDto.Request.class);
	}
}

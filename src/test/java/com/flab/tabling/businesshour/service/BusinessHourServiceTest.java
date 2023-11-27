package com.flab.tabling.businesshour.service;

import static org.assertj.core.api.Assertions.*;
import static org.jeasy.random.FieldPredicates.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Optional;

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
import com.flab.tabling.businesshour.exception.BusinessHourNotFoundException;
import com.flab.tabling.businesshour.repository.BusinessHourRepository;
import com.flab.tabling.store.StoreFixture;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.exception.StoreNotFoundException;
import com.flab.tabling.store.repository.StoreRepository;
import com.flab.tabling.store.service.StoreService;

@ExtendWith(MockitoExtension.class)
class BusinessHourServiceTest {

	@InjectMocks
	private BusinessHourService businessHourService;
	@Mock
	private BusinessHourRepository businessHourRepository;
	@Mock
	private StoreRepository storeRepository;
	@Mock
	private StoreService storeService;
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();
	private StoreFixture storeFixture = FixtureFactory.storeFixture();

	@Test
	@DisplayName("운영 시간 등록에 성공하면 응답을 반환한다.")
	void addSuccess() {
		//given
		BusinessHourAddDto.Request businessHourAddRequest = getBusinessHourAddRequest(2L);
		Store targetStore = storeFixture.getStore(2L, 1L);
		BusinessHour businessHour = businessHourFixture.getBusinessHour(3L, 2L);

		doReturn(Optional.ofNullable(targetStore)).when(storeRepository).findById(2L);
		doReturn(businessHour).when(businessHourRepository).save(any(BusinessHour.class));

		//when
		BusinessHourAddDto.Response businessHourAddResponse = businessHourService.add(1L, businessHourAddRequest);

		//then
		assertThat(businessHourAddResponse.getId()).isEqualTo(3L);
	}

	@Test
	@DisplayName("존재하지 않는 식당이라면 예외가 발생하고 운영 시간 등록에 실패한다.")
	void addFailWithNoStore() {
		//given
		BusinessHourAddDto.Request businessHourAddRequest = getBusinessHourAddRequest(2L);

		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected
		assertThrows(StoreNotFoundException.class, () -> businessHourService.add(1L, businessHourAddRequest));
	}

	@Test
	@DisplayName("운영 시간 수정에 성공하면 응답을 반환한다.")
	void updateSuccess() {
		//given
		BusinessHourUpdateDto.Request businessHourUpdateRequest = getBusinessHourUpdateRequest(3L);
		BusinessHour businessHour = businessHourFixture.getBusinessHour(3L, 2L, 1L);

		doReturn(Optional.ofNullable(businessHour)).when(businessHourRepository).findById(3L);

		//when
		BusinessHourUpdateDto.Response businessHourUpdateResponse = businessHourService.update(3L, 1L,
			businessHourUpdateRequest);

		//then
		assertThat(businessHourUpdateResponse.getId()).isEqualTo(3L);
	}

	@Test
	@DisplayName("존재하지 않는 운영 시간이라면 예외가 발생하고 수정에 실패한다.")
	void updateFailWithNoBusinessHour() {
		//given
		BusinessHourUpdateDto.Request businessHourUpdateRequest = getBusinessHourUpdateRequest(3L);

		doReturn(Optional.empty()).when(businessHourRepository).findById(3L);

		//expected
		assertThrows(BusinessHourNotFoundException.class,
			() -> businessHourService.update(3L, 1L, businessHourUpdateRequest));
	}

	@Test
	@DisplayName("운영 시간 삭제에 성공하면 아무런 응답을 반환하지 않는다.")
	void deleteSuccess() {
		//given
		BusinessHour businessHour = businessHourFixture.getBusinessHour(3L, 2L);

		doReturn(Optional.ofNullable(businessHour)).when(businessHourRepository).findById(3L);

		//when
		businessHourService.delete(3L, 1L);

		//then
		verify(businessHourRepository, times(1)).delete(businessHour);
	}

	@Test
	@DisplayName("존재하지 않는 운영 시간이라면 예외가 발생하고 삭제에 실패한다.")
	void deleteFailWithNoBusinessHour() {
		doReturn(Optional.empty()).when(businessHourRepository).findById(3L);

		//expected
		assertThrows(BusinessHourNotFoundException.class, () -> businessHourService.delete(3L, 1L));
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

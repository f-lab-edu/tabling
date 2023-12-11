package com.flab.tabling.businesshour.facade;

import static org.assertj.core.api.Assertions.*;
import static org.jeasy.random.FieldPredicates.*;
import static org.mockito.Mockito.*;

import java.util.List;

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
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryService;
import com.flab.tabling.businesshour.service.BusinessHourService;
import com.flab.tabling.store.StoreFixture;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.service.StoreQueryService;
import com.flab.tabling.store.service.StoreService;

@ExtendWith(MockitoExtension.class)
class BusinessHourFacadeTest {

	@InjectMocks
	private BusinessHourFacade businessHourFacade;
	@Mock
	private BusinessHourService businessHourService;
	@Mock
	private BusinessHourQueryService businessHourQueryService;
	@Mock
	private StoreService storeService;
	@Mock
	private StoreQueryService storeQueryService;
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();
	private StoreFixture storeFixture = FixtureFactory.storeFixture();

	@Test
	@DisplayName("운영 시간 등록에 성공하면 응답을 반환한다.")
	void addSuccess() {
		//given
		BusinessHourAddDto.Request businessHourAddRequest = getBusinessHourAddRequest(2L);
		Store targetStore = storeFixture.getStore(2L, 1L);
		BusinessHourAddDto.Response mockBusinessHourAddResponse = getBusinessHourAddResponse(3L);

		doReturn(targetStore).when(storeQueryService).getStore(2L);
		doReturn(mockBusinessHourAddResponse).when(businessHourService).add(businessHourAddRequest, targetStore);

		//when
		BusinessHourAddDto.Response businessHourAddResponse = businessHourFacade.add(1L, businessHourAddRequest);

		//then
		assertThat(businessHourAddResponse.getId()).isEqualTo(3L);
		verify(storeService, times(1)).validateAuth(targetStore, 1L);
		verify(businessHourService, times(1)).add(businessHourAddRequest, targetStore);
	}

	@Test
	@DisplayName("식당 id로 운영 시간 dto 조회에 성공한다.")
	void findSuccessWithStoreId() {
		//given
		List<BusinessHourFindDto.Response> businessHourFindResponses = getBusinessHourFindResponses();

		doReturn(businessHourFindResponses).when(businessHourQueryService).find(2L);

		//when
		businessHourFacade.find(2L);

		//then
		verify(businessHourQueryService, times(1)).find(2L);
	}

	@Test
	@DisplayName("운영 시간 수정에 성공하면 응답을 반환한다.")
	void updateSuccess() {
		//given
		BusinessHourUpdateDto.Request businessHourUpdateRequest = getBusinessHourUpdateRequest(3L);
		BusinessHour businessHour = businessHourFixture.getBusinessHour(3L, 2L, 1L);

		doReturn(businessHour).when(businessHourQueryService).getBusinessHour(3L);

		//when
		businessHourFacade.update(3L, 1L, businessHourUpdateRequest);

		//then
		verify(businessHourQueryService, times(1)).getBusinessHour(3L);
		verify(storeService, times(1)).validateAuth(businessHour.getStore(), 1L);
		verify(businessHourService, times(1)).update(businessHour, businessHourUpdateRequest);
	}

	@Test
	@DisplayName("운영 시간 삭제에 성공하면 아무런 응답을 반환하지 않는다.")
	void deleteSuccess() {
		//given
		BusinessHour businessHour = businessHourFixture.getBusinessHour(3L, 2L, 1L);

		doReturn(businessHour).when(businessHourQueryService).getBusinessHour(3L);

		//when
		businessHourFacade.delete(3L, 1L);

		//then
		verify(businessHourService, times(1)).delete(businessHour);
	}

	private BusinessHourAddDto.Request getBusinessHourAddRequest(Long storeId) {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("storeId"), () -> storeId);
		return new EasyRandom(parameters).nextObject(BusinessHourAddDto.Request.class);
	}

	private BusinessHourAddDto.Response getBusinessHourAddResponse(Long id) {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("id"), () -> id);
		return new EasyRandom(parameters).nextObject(BusinessHourAddDto.Response.class);
	}

	private List<BusinessHourFindDto.Response> getBusinessHourFindResponses() {
		return businessHourFixture.getBusinessHoursWithBreakTime(2L, 8, 15, 18, 22).stream()
			.map(BusinessHourFindDto.Response::new)
			.toList();
	}

	private BusinessHourUpdateDto.Request getBusinessHourUpdateRequest(Long id) {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("id"), () -> id);
		return new EasyRandom(parameters).nextObject(BusinessHourUpdateDto.Request.class);
	}
}

package com.flab.tabling.store.service;

import static org.assertj.core.api.Assertions.*;
import static org.jeasy.random.FieldPredicates.*;
import static org.junit.jupiter.api.Assertions.*;
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
import com.flab.tabling.global.exception.AuthorizationException;
import com.flab.tabling.store.StoreFixture;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.repository.StoreRepository;

@ExtendWith(MockitoExtension.class)
class StoreServiceTest {
	@InjectMocks
	private StoreService storeService;
	@Mock
	private StoreRepository storeRepository;
	private StoreFixture storeFixture = FixtureFactory.storeFixture();

	@Test
	@DisplayName("식당 등록에 성공하면 식당 id를 포함한 응답이 반환된다.")
	void addStoreSuccess() {
		//given
		Store savedStore = storeFixture.getStore(2L, 1L);
		StoreAddDto.Request mockStoreAddRequest = getStoreAddRequest();

		doReturn(savedStore).when(storeRepository).save(any(Store.class));

		//when
		StoreAddDto.Response storeAddResponse = storeService.add(mockStoreAddRequest, savedStore.getMember());

		//then
		assertThat(storeAddResponse.getId()).isEqualTo(savedStore.getId());
	}

	@Test
	@DisplayName("요청한 정보로 식당 정보 수정에 성공한다.")
	void updateStoreSuccess() {
		//given
		Store targetStore = storeFixture.getStore(2L);
		StoreUpdateDto.Request storeUpdateRequest = getStoreUpdateRequest(2L);

		//when
		storeService.update(targetStore, storeUpdateRequest);

		//then
		assertThat(targetStore.getName()).isEqualTo(storeUpdateRequest.getName());
		assertThat(targetStore.getCategory()).isEqualTo(storeUpdateRequest.getCategory());
		assertThat(targetStore.getDescription()).isEqualTo(storeUpdateRequest.getDescription());
		assertThat(targetStore.getMaxWaitingCount()).isEqualTo(storeUpdateRequest.getMaxWaitingCount());
	}

	@Test
	@DisplayName("식당 삭제에 성공하고 아무것도 반환하지 않는다.")
	void deleteStoreSuccess() {
		//given
		Store targetStore = storeFixture.getStore(2L);

		//when
		storeService.delete(targetStore);

		//then
		verify(storeRepository, times(1)).delete(any(Store.class));
	}

	@Test
	@DisplayName("요청자가 식당 주인이 맞다면, 검증은 성공하고 아무것도 반환하지 않는다.")
	void validationSuccess() {
		//given
		Store targetStore = storeFixture.getStore(2L, 1L);

		//expected
		assertDoesNotThrow(() -> storeService.validateAuth(targetStore, 1L));
	}

	@Test
	@DisplayName("요청자가 식당 주인이 아니라면, 검증은 실패하고 예외가 발생한다.")
	void validationFailWithNoAuth() {
		//given
		Store targetStore = storeFixture.getStore(2L, 1L);

		//expected
		assertThrows(AuthorizationException.class, () -> storeService.validateAuth(targetStore, 10L));
	}

	private StoreAddDto.Request getStoreAddRequest() {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("name"), () -> "test_name")
			.randomize(named("description"), () -> "test_description")
			.randomize(named("maxWaitingCount"), () -> 10);
		return new EasyRandom(parameters).nextObject(StoreAddDto.Request.class);
	}

	private StoreUpdateDto.Request getStoreUpdateRequest(Long id) {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("id"), () -> id)
			.randomize(named("name"), () -> "test_name")
			.randomize(named("description"), () -> "test_description")
			.randomize(named("maxWaitingCount"), () -> 10);
		return new EasyRandom(parameters).nextObject(StoreUpdateDto.Request.class);
	}
}

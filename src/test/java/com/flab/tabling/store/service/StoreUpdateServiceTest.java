package com.flab.tabling.store.service;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Optional;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.jeasy.random.FieldPredicates;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.repository.StoreRepository;

@ExtendWith(MockitoExtension.class)
class StoreUpdateServiceTest {
	@InjectMocks
	private StoreUpdateService storeUpdateService;
	@Mock
	private StoreRepository storeRepository;
	private EasyRandom easyRandom = new EasyRandom();

	@Test
	@DisplayName("식당이 존재하고, 요청한 사용자가 식당 주인이 맞다면, 성공적으로 수정되고 응답을 반환한다.")
	void updateStoreSuccess() {
		//given
		Store findStore = getStoreWithFixedMember();
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);

		doReturn(Optional.ofNullable(findStore)).when(storeRepository).findById(storeUpdateRequest.getId());

		//when
		StoreUpdateDto.Response result = storeUpdateService.update(storeUpdateRequest, 1L);

		//then
		assertThat(result.getId()).isEqualTo(storeUpdateRequest.getId());
	}

	@Test
	@DisplayName("수정 대상 식당이 존재하지 않으면, 수정은 실패하고 예외가 발생한다.")
	void updateStoreFailWithNotFoundStore() {
		//given
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);

		doReturn(Optional.empty()).when(storeRepository).findById(storeUpdateRequest.getId());

		//expected // TODO: 2023-10-10 커스텀 예외로 수정 필요
		assertThrows(RuntimeException.class, () -> storeUpdateService.update(storeUpdateRequest, 1L));
	}

	@Test
	@DisplayName("요청한 사용자가 식당 주인이 아니라면, 수정은 실패하고 예외가 발생한다.")
	void updateStoreFailWithNoAuth() {
		//given
		Store findStore = getStoreWithFixedMember();
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);

		doReturn(Optional.ofNullable(findStore)).when(storeRepository).findById(storeUpdateRequest.getId());

		//expected // TODO: 2023-10-13 커스텀 예외로 수정 필요
		assertThrows(RuntimeException.class, () -> storeUpdateService.update(storeUpdateRequest, 10L));
	}

	private Store getStoreWithFixedMember() {
		EasyRandomParameters storeConditions = new EasyRandomParameters()
			.randomize(Member.class, this::getMemberWithFixedId);
		EasyRandom storeRandom = new EasyRandom(storeConditions);
		return storeRandom.nextObject(Store.class);
	}

	private Member getMemberWithFixedId() {
		EasyRandomParameters memberConditions = new EasyRandomParameters()
			.randomize(FieldPredicates.named("id"), () -> 1L);
		EasyRandom memberRandom = new EasyRandom(memberConditions);
		return memberRandom.nextObject(Member.class);
	}
}

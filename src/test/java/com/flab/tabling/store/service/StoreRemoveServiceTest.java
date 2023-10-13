package com.flab.tabling.store.service;

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
import com.flab.tabling.store.repository.StoreRepository;

@ExtendWith(MockitoExtension.class)
class StoreRemoveServiceTest {
	@InjectMocks
	private StoreRemoveService storeRemoveService;
	@Mock
	private StoreRepository storeRepository;

	@Test
	@DisplayName("식당이 존재하고, 요청자가 식당 주인이라면, 식당은 성공적으로 삭제되고 아무것도 반환하지 않는다.")
	void deleteStoreSuccess() {
		//given
		Store findStore = getStoreWithFixedMember();

		doReturn(Optional.ofNullable(findStore)).when(storeRepository).findById(2L);

		//when
		storeRemoveService.delete(2L, 1L);

		//then
		verify(storeRepository, times(1)).delete(any(Store.class));
	}

	@Test
	@DisplayName("삭제 대상 식당이 존재하지 않으면, 삭제는 실패하고 예외가 발생한다.")
	void deleteStoreFailWithNotFoundStore() {
		//given
		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected // TODO: 2023-10-13 커스텀 예외로 수정 필요
		assertThrows(RuntimeException.class, () -> storeRemoveService.delete(2L, 1L));
	}

	@Test
	@DisplayName("요청자가 식당 주인이 아니라면, 삭제는 실패하고 예외가 발생한다.")
	void deleteStoreFailWithNoAuth() {
		Store findStore = getStoreWithFixedMember();

		doReturn(Optional.ofNullable(findStore)).when(storeRepository).findById(2L);

		//expected // TODO: 2023-10-13 커스텀 예외로 수정 필요
		assertThrows(RuntimeException.class, () -> storeRemoveService.delete(2L, 10L));
	}

	private Store getStoreWithFixedMember() {
		EasyRandomParameters storeConditions = new EasyRandomParameters()
			.randomize(Member.class, this::getMemberWithFixedId)
			.randomize(FieldPredicates.named("id"), () -> 2L);
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

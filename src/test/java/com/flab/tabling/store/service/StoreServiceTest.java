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
import com.flab.tabling.member.repository.MemberRepository;
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
	@Mock
	private MemberRepository memberRepository;
	private EasyRandom easyRandom = new EasyRandom();

	@Test
	@DisplayName("식당 등록에 성공하면 식당 id를 포함한 응답이 반환된다.")
	void addStoreSuccess() {
		//given
		Member seller = easyRandom.nextObject(Member.class);
		Store savedStore = easyRandom.nextObject(Store.class);
		StoreAddDto.Request storeRequestDto = easyRandom.nextObject(StoreAddDto.Request.class);

		doReturn(Optional.ofNullable(seller)).when(memberRepository).findById(1L);
		doReturn(savedStore).when(storeRepository).save(any(Store.class));

		//when
		storeService.add(storeRequestDto, 1L);

		//then
		verify(storeRepository, times(1)).save(any(Store.class));
	}

	@Test
	@DisplayName("잘못된 식별자로 회원을 조회할 수 없거나, 회원이 존재하지 않는다면 식당 등록에 실패한다.")
	void addStoreFailWithIncorrectMemberId() {
		//given
		StoreAddDto.Request storeRequestDto = easyRandom.nextObject(StoreAddDto.Request.class);

		doReturn(Optional.empty()).when(memberRepository).findById(1L);
		// TODO: 2023-10-04 커스텀 예외로 수정 필요
		//expected
		assertThrows(RuntimeException.class, () -> storeService.add(storeRequestDto, 1L));
	}

	@Test
	@DisplayName("식당이 존재하고, 요청한 사용자가 식당 주인이 맞다면, 성공적으로 수정되고 응답을 반환한다.")
	void updateStoreSuccess() {
		//given
		Store findStore = getStoreWithFixedMember();
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);

		doReturn(Optional.ofNullable(findStore)).when(storeRepository).findById(storeUpdateRequest.getId());

		//when
		StoreUpdateDto.Response result = storeService.update(storeUpdateRequest, 1L);

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
		assertThrows(RuntimeException.class, () -> storeService.update(storeUpdateRequest, 1L));
	}

	@Test
	@DisplayName("요청한 사용자가 식당 주인이 아니라면, 수정은 실패하고 예외가 발생한다.")
	void updateStoreFailWithNoAuth() {
		//given
		Store findStore = getStoreWithFixedMember();
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);

		doReturn(Optional.ofNullable(findStore)).when(storeRepository).findById(storeUpdateRequest.getId());

		//expected // TODO: 2023-10-13 커스텀 예외로 수정 필요
		assertThrows(RuntimeException.class, () -> storeService.update(storeUpdateRequest, 10L));
	}

	@Test
	@DisplayName("식당이 존재하고, 요청자가 식당 주인이라면, 식당은 성공적으로 삭제되고 아무것도 반환하지 않는다.")
	void deleteStoreSuccess() {
		//given
		Store findStore = getStoreWithFixedMember();

		doReturn(Optional.ofNullable(findStore)).when(storeRepository).findById(2L);

		//when
		storeService.delete(2L, 1L);

		//then
		verify(storeRepository, times(1)).delete(any(Store.class));
	}

	@Test
	@DisplayName("삭제 대상 식당이 존재하지 않으면, 삭제는 실패하고 예외가 발생한다.")
	void deleteStoreFailWithNotFoundStore() {
		//given
		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected // TODO: 2023-10-13 커스텀 예외로 수정 필요
		assertThrows(RuntimeException.class, () -> storeService.delete(2L, 1L));
	}

	@Test
	@DisplayName("요청자가 식당 주인이 아니라면, 삭제는 실패하고 예외가 발생한다.")
	void deleteStoreFailWithNoAuth() {
		Store findStore = getStoreWithFixedMember();

		doReturn(Optional.ofNullable(findStore)).when(storeRepository).findById(2L);

		//expected // TODO: 2023-10-13 커스텀 예외로 수정 필요
		assertThrows(RuntimeException.class, () -> storeService.delete(2L, 10L));
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

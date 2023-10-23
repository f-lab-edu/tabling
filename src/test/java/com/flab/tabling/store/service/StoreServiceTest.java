package com.flab.tabling.store.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Optional;

import org.jeasy.random.EasyRandom;
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

}

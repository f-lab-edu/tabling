package com.flab.tabling.store.service;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.jeasy.random.EasyRandom;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
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
	@DisplayName("식당 id로 조회를 성공하면 응답 dto를 반환한다.")
	void findStoreSuccess() {
		//given
		Store savedStore = easyRandom.nextObject(Store.class);

		doReturn(Optional.ofNullable(savedStore)).when(storeRepository).findById(2L);

		//when
		StoreFindDto.Response storeFindResponse = storeService.find(2L);

		//then
		assertThat(storeFindResponse.getName()).isEqualTo(savedStore.getName());
	}

	@Test
	@DisplayName("전달받은 id로 식당을 조회하지 못하면 예외가 발생한다.")
	void findStoreFailWithInvalidStoreId() {
		//given
		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected TODO: 2023-10-08 커스텀 예외로 교체 필요
		assertThrows(RuntimeException.class, () -> storeService.find(2L));
	}

	@Test
	@DisplayName("페이지 조건에 맞는 식당 정보 조회에 성공하면 dto 페이지를 전달한다.")
	void findPageSuccessWithPageCondition() {
		//given
		Store storeA = easyRandom.nextObject(Store.class);
		Store storeB = easyRandom.nextObject(Store.class);

		List<Store> storeList = new ArrayList<>();
		storeList.add(storeA);
		storeList.add(storeB);

		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		PageImpl<Store> storePage = new PageImpl<>(storeList, pageable, 1);

		doReturn(storePage).when(storeRepository).findAll(pageable);

		//when
		Page<StoreFindDto.Response> storeFindResponsePage = storeService.findPage(pageable);

		//then
		List<StoreFindDto.Response> pageContent = storeFindResponsePage.getContent();
		StoreFindDto.Response storeAFindResponse = pageContent.get(0);

		assertThat(pageContent.size()).isEqualTo(2);
		assertThat(storeAFindResponse.getName()).isEqualTo(storeA.getName());
	}

	@Test
	@DisplayName("조회할 내용이 없다면 빈 페이지를 반환한다.")
	void findEmptyPageWithNoContent() {
		//given
		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		PageImpl<Store> emptyPage = new PageImpl<>(List.of(), pageable, 1);

		doReturn(emptyPage).when(storeRepository).findAll(pageable);

		//when
		Page<StoreFindDto.Response> storeFindRespnosePage = storeService.findPage(pageable);

		//then
		List<StoreFindDto.Response> pageContent = storeFindRespnosePage.getContent();
		assertThat(pageContent.size()).isEqualTo(0);
	}
}

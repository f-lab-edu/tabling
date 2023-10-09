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

import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.repository.StoreRepository;

@ExtendWith(MockitoExtension.class)
class StoreQueryServiceTest {

	@InjectMocks
	private StoreQueryService storeQueryService;
	@Mock
	private StoreRepository storeRepository;
	private EasyRandom easyRandom = new EasyRandom();

	@Test
	@DisplayName("식당 id로 조회를 성공하면 응답 dto를 반환한다.")
	void findStoreSuccess() {
		//given
		Store savedStore = easyRandom.nextObject(Store.class);

		doReturn(Optional.ofNullable(savedStore)).when(storeRepository).findById(2L);

		//when
		StoreFindDto.Response storeFindResponse = storeQueryService.find(2L);

		//then
		assertThat(storeFindResponse.getName()).isEqualTo(savedStore.getName());
	}

	@Test
	@DisplayName("전달받은 id로 식당을 조회하지 못하면 예외가 발생한다.")
	void findStoreFailWithInvalidStoreId() {
		//given
		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected TODO: 2023-10-08 커스텀 예외로 교체 필요
		assertThrows(RuntimeException.class, () -> storeQueryService.find(2L));
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
		Page<StoreFindDto.Response> storeFindResponsePage = storeQueryService.findPage(pageable);

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
		Page<StoreFindDto.Response> storeFindRespnosePage = storeQueryService.findPage(pageable);

		//then
		List<StoreFindDto.Response> pageContent = storeFindRespnosePage.getContent();
		assertThat(pageContent.size()).isEqualTo(0);
	}
}

package com.flab.tabling.store.service;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.List;
import java.util.Optional;

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

import com.flab.tabling.FixtureFactory;
import com.flab.tabling.store.StoreFixture;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.exception.StoreNotFoundException;
import com.flab.tabling.store.repository.StoreRepository;

@ExtendWith(MockitoExtension.class)
class StoreQueryServiceTest {

	@InjectMocks
	private StoreQueryService storeQueryService;
	@Mock
	private StoreRepository storeRepository;
	private StoreFixture storeFixture = FixtureFactory.storeFixture();

	@Test
	@DisplayName("식당 id로 도메인 조회에 성공한다.")
	void getStoreSuccess() {
		//given
		Store savedStore = storeFixture.getStore(2L);

		doReturn(Optional.ofNullable(savedStore)).when(storeRepository).findById(2L);

		//when
		storeQueryService.getStore(2L);

		//then
		verify(storeRepository, times(1)).findById(2L);
	}

	@Test
	@DisplayName("식당 id로 도메인 조회에 실패하면 예외가 발생한다.")
	void getStoreFailWithInvalidStoreId() {
		//given
		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected
		assertThrows(StoreNotFoundException.class, () -> storeQueryService.getStore(2L));
	}

	@Test
	@DisplayName("식당 id로 응답 dto 조회에 성공한다.")
	void findStoreSuccess() {
		//given
		Store savedStore = storeFixture.getStore(2L);

		doReturn(Optional.ofNullable(savedStore)).when(storeRepository).findById(2L);

		//when
		StoreFindDto.Response storeFindResponse = storeQueryService.find(2L);

		//then
		assertThat(storeFindResponse.getName()).isEqualTo(savedStore.getName());
	}

	@Test
	@DisplayName("식당 id로 응답 dto 조회에 실패하면 예외가 발생한다.")
	void findStoreFailWithInvalidStoreId() {
		//given
		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected
		assertThrows(StoreNotFoundException.class, () -> storeQueryService.find(2L));
	}

	// TODO: 2024-01-07 성능 측정 후, 페이징 기능으로 변경
	@Test
	@DisplayName("요청한 식당 이름과 동일한 식당 목록 반환에 성공한다.")
	void findStoresSuccessByName() {
		//given
		String storeName = "store_name";
		List<Store> stores = storeFixture.getStores(2L, 3L);

		doReturn(stores).when(storeRepository).findStoresByName(storeName);

		//when
		List<StoreFindDto.Response> storeFindResponses = storeQueryService.find(storeName);

		//then
		assertThat(storeFindResponses.size()).isEqualTo(2L);
	}

	@Test
	@DisplayName("조건에 맞는 식당 페이지 dto 조회에 성공한다.")
	void findPageSuccessWithPageCondition() {
		//given
		List<Store> stores = storeFixture.getStores(2L, 3L);
		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		PageImpl<Store> storePage = new PageImpl<>(stores, pageable, 1);

		doReturn(storePage).when(storeRepository).findAll(pageable);

		//when
		Page<StoreFindDto.Response> storeFindResponsePage = storeQueryService.findPage(pageable);

		//then
		List<StoreFindDto.Response> responsePage = storeFindResponsePage.getContent();
		assertThat(responsePage.size()).isEqualTo(2);
		assertThat(responsePage.get(0)).usingRecursiveComparison().isEqualTo(new StoreFindDto.Response(stores.get(0)));
		assertThat(responsePage.get(1)).usingRecursiveComparison().isEqualTo(new StoreFindDto.Response(stores.get(1)));
	}

	@Test
	@DisplayName("조건에 맞는 식당 정보가 없다면 빈 페이지를 반환한다.")
	void findEmptyPageWithNoContent() {
		//given
		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		PageImpl<Store> emptyPage = new PageImpl<>(List.of(), pageable, 1);

		doReturn(emptyPage).when(storeRepository).findAll(pageable);

		//when
		Page<StoreFindDto.Response> storeFindRespnosePage = storeQueryService.findPage(pageable);

		//then
		List<StoreFindDto.Response> responsePage = storeFindRespnosePage.getContent();
		assertThat(responsePage.size()).isEqualTo(0);
	}

	@Test // TODO: 2024-01-07 페이징 기능과 비교후 제거
	@DisplayName("식당 전체 목록 조회에 성공한다.")
	void findAllSuccess() {
		//given
		List<Store> stores = storeFixture.getStores(2L, 3L);

		doReturn(stores).when(storeRepository).findAll();

		//when
		List<StoreFindDto.Response> storeFindResponses = storeQueryService.findAll();

		//then
		assertThat(storeFindResponses.size()).isEqualTo(2L);
	}
}

package com.flab.tabling.store.facade;

import static org.assertj.core.api.Assertions.*;
import static org.jeasy.random.FieldPredicates.*;
import static org.mockito.ArgumentMatchers.*;
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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.flab.tabling.FixtureFactory;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.service.MemberQueryService;
import com.flab.tabling.store.StoreFixture;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.service.StoreQueryService;
import com.flab.tabling.store.service.StoreService;

@ExtendWith(MockitoExtension.class)
class StoreFacadeTest {

	@InjectMocks
	private StoreFacade storeFacade;
	@Mock
	private StoreService storeService;
	@Mock
	private StoreQueryService storeQueryService;
	@Mock
	private MemberQueryService memberQueryService;
	private EasyRandom easyRandom = new EasyRandom();
	private StoreFixture storeFixture = FixtureFactory.storeFixture();

	@Test
	@DisplayName("식당 등록에 성공하면 식당 id를 포함한 응답이 반환된다.")
	void addStoreSuccess() {
		//given
		Member seller = easyRandom.nextObject(Member.class); // TODO: 2023-12-11 member fixture 사용하도록 수정 필요
		StoreAddDto.Request mockStoreAddRequest = getStoreAddRequest();
		StoreAddDto.Response mockStoreAddResponse = getStoreAddResponse();

		doReturn(seller).when(memberQueryService).getMember(1L);
		doReturn(mockStoreAddResponse).when(storeService).add(mockStoreAddRequest, seller);

		//when
		StoreAddDto.Response storeAddResponse = storeFacade.add(mockStoreAddRequest, 1L);

		//then
		assertThat(storeAddResponse.getId()).isEqualTo(mockStoreAddResponse.getId());
		verify(memberQueryService, times(1)).getMember(1L);
	}

	@Test
	@DisplayName("식당 id로 조회를 성공하면 응답 dto를 반환한다.")
	void findStoreSuccess() {
		//given
		Store savedStore = storeFixture.getStore(2L);
		StoreFindDto.Response storeFindResponse = new StoreFindDto.Response(savedStore);

		doReturn(storeFindResponse).when(storeQueryService).find(2L);

		//when
		storeFacade.find(2L);

		//then
		verify(storeQueryService, times(1)).find(2L);
	}

	// TODO: 2024-01-07 성능 측정 후, 페이징 기능으로 변경
	@Test
	@DisplayName("요청한 식당 이름과 동일한 식당 목록 반환에 성공한다.")
	void findStoresSuccessByName() {
		//given
		String storeName = "store_name";
		List<StoreFindDto.Response> storeFindResponses = storeFixture.getStores(2L, 3L)
			.stream()
			.map(StoreFindDto.Response::new)
			.toList();

		doReturn(storeFindResponses).when(storeQueryService).find(storeName);

		//when
		StoreFindDto.Responses result = storeFacade.find(storeName);

		//then
		assertThat(result.getStoreFindResponses().size()).isEqualTo(2);
	}

	@Test
	@DisplayName("조건에 맞는 식당 페이지 dto 조회에 성공한다.")
	void findPageSuccessWithPageCondition() {
		//given
		List<Store> stores = storeFixture.getStores(2L, 3L);
		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		Page<StoreFindDto.Response> storeFindPage = new PageImpl<>(stores, pageable, 1).map(StoreFindDto.Response::new);

		doReturn(storeFindPage).when(storeQueryService).findPage(pageable);

		//when
		storeFacade.findPage(pageable);

		//then
		verify(storeQueryService, times(1)).findPage(pageable);
	}

	@Test // TODO: 2024-01-07 페이징 기능과 비교후 제거
	@DisplayName("식당 전체 목록 조회에 성공한다.")
	void findAllSuccess() {
		//given
		List<StoreFindDto.Response> storeFindResponses = storeFixture.getStores(2L, 3L)
			.stream()
			.map(StoreFindDto.Response::new)
			.toList();

		doReturn(storeFindResponses).when(storeQueryService).findAll();

		//when
		storeFacade.findAll();

		//then
		verify(storeQueryService, times(1)).findAll();
	}

	@Test
	@DisplayName("식당이 존재하고, 요청한 사용자가 식당 주인이 맞다면, 식당 정보 수정에 성공한다.")
	void updateStoreSuccess() {
		//given
		Store targetStore = storeFixture.getStore(2L);
		StoreUpdateDto.Request storeUpdateRequest = getStoreUpdateRequest(2L);
		StoreUpdateDto.Response storeUpdateResponse = getStoreUpdateResponse(2L);

		doReturn(targetStore).when(storeQueryService).getStore(storeUpdateRequest.getId());
		doReturn(storeUpdateResponse).when(storeService).update(targetStore, storeUpdateRequest);

		//when
		StoreUpdateDto.Response result = storeFacade.update(storeUpdateRequest, 1L);

		//then
		assertThat(result.getId()).isEqualTo(storeUpdateRequest.getId());
		verify(storeQueryService, times(1)).getStore(2L);
		verify(storeService, times(1)).validateAuth(any(Store.class), eq(1L));
		verify(storeService, times(1)).update(any(Store.class), eq(storeUpdateRequest));
	}

	@Test
	@DisplayName("식당이 존재하고, 요청자가 식당 주인이라면, 식당은 성공적으로 삭제되고 아무것도 반환하지 않는다.")
	void deleteStoreSuccess() {
		//given
		Store targetStore = storeFixture.getStore(2L);

		doReturn(targetStore).when(storeQueryService).getStore(2L);

		//when
		storeFacade.delete(2L, 1L);

		//then
		verify(storeService, times(1)).delete(any(Store.class));
	}

	private StoreAddDto.Request getStoreAddRequest() {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("name"), () -> "test_name")
			.randomize(named("description"), () -> "test_description")
			.randomize(named("maxWaitingCount"), () -> 10);
		return new EasyRandom(parameters).nextObject(StoreAddDto.Request.class);
	}

	private StoreAddDto.Response getStoreAddResponse() {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("id"), () -> 2L);
		return new EasyRandom(parameters).nextObject(StoreAddDto.Response.class);
	}

	private StoreUpdateDto.Request getStoreUpdateRequest(Long id) {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("id"), () -> id);
		return new EasyRandom(parameters).nextObject(StoreUpdateDto.Request.class);
	}

	private StoreUpdateDto.Response getStoreUpdateResponse(Long id) {
		EasyRandomParameters parameters = new EasyRandomParameters()
			.randomize(named("id"), () -> id);
		return new EasyRandom(parameters).nextObject(StoreUpdateDto.Response.class);
	}
}

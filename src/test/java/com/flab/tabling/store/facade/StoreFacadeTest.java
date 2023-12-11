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
import com.flab.tabling.member.service.MemberService;
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
	private MemberService memberService;
	private EasyRandom easyRandom = new EasyRandom();
	private StoreFixture storeFixture = FixtureFactory.storeFixture();

	@Test
	@DisplayName("식당 등록에 성공하면 식당 id를 포함한 응답이 반환된다.")
	void addStoreSuccess() {
		//given
		Member seller = easyRandom.nextObject(Member.class); // TODO: 2023-12-11 member fixture 사용하도록 수정 필요
		StoreAddDto.Request mockStoreAddRequest = getStoreAddRequest();
		StoreAddDto.Response mockStoreAddResponse = getStoreAddResponse();

		doReturn(seller).when(memberService).getMember(1L);
		doReturn(mockStoreAddResponse).when(storeService).add(mockStoreAddRequest, seller);

		//when
		StoreAddDto.Response storeAddResponse = storeFacade.add(mockStoreAddRequest, 1L);

		//then
		assertThat(storeAddResponse.getId()).isEqualTo(mockStoreAddResponse.getId());
		verify(memberService, times(1)).getMember(1L);
	}

	@Test
	@DisplayName("식당 id로 조회를 성공하면 응답 dto를 반환한다.")
	void findStoreSuccess() {
		//given
		Store savedStore = storeFixture.getStore(2L);
		StoreFindDto.Response mockStoreFindResponse = new StoreFindDto.Response(savedStore);

		doReturn(mockStoreFindResponse).when(storeQueryService).find(2L);

		//when
		StoreFindDto.Response storeFindResponse = storeFacade.find(2L);

		//then
		assertThat(storeFindResponse.getName()).isEqualTo(mockStoreFindResponse.getName());
	}

	@Test
	@DisplayName("조건에 맞는 식당 페이지 dto 조회에 성공한다.")
	void findPageSuccessWithPageCondition() {
		//given
		List<Store> stores = storeFixture.getStores(2L, 3L);
		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		Page<StoreFindDto.Response> mockStoreFindPage = new PageImpl<>(stores, pageable, 1).map(
			StoreFindDto.Response::new);

		doReturn(mockStoreFindPage).when(storeQueryService).findPage(pageable);

		//when
		Page<StoreFindDto.Response> storeFindPage = storeFacade.findPage(pageable);

		//then
		List<StoreFindDto.Response> responsePage = storeFindPage.getContent();
		assertThat(responsePage.size()).isEqualTo(2);
		assertThat(responsePage.get(0)).usingRecursiveComparison().isEqualTo(new StoreFindDto.Response(stores.get(0)));
		assertThat(responsePage.get(1)).usingRecursiveComparison().isEqualTo(new StoreFindDto.Response(stores.get(1)));
	}

	@Test
	@DisplayName("식당이 존재하고, 요청한 사용자가 식당 주인이 맞다면, 식당 정보 수정에 성공한다.")
	void updateStoreSuccess() {
		//given
		Store targetStore = storeFixture.getStore(2L);
		StoreUpdateDto.Request storeUpdateRequest = getStoreUpdateRequest(2L);

		doReturn(targetStore).when(storeQueryService).getStore(storeUpdateRequest.getId());

		//when
		StoreUpdateDto.Response storeUpdateResponse = storeFacade.update(storeUpdateRequest, 1L);

		//then
		assertThat(storeUpdateResponse.getId()).isEqualTo(storeUpdateRequest.getId());
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
}

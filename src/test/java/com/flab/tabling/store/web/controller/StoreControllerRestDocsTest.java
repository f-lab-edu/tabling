package com.flab.tabling.store.web.controller;

import static org.jeasy.random.FieldPredicates.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.jeasy.random.randomizers.range.IntegerRangeRandomizer;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.flab.tabling.global.config.AbstractRestDocsTest;
import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.facade.StoreFacade;

@WebMvcTest(StoreController.class)
class StoreControllerRestDocsTest extends AbstractRestDocsTest {

	@MockBean
	private StoreFacade storeFacade;

	@Test
	@DisplayName("식당 등록 요청이 성공하면 등록한 식당에 대한 응답과 상태코드를 반환한다.")
	void addStoreSuccess() throws Exception {
		//given
		EasyRandom easyRandom = getStoreDtoEasyRandom(2L);
		StoreAddDto.Request requestDto = easyRandom.nextObject(StoreAddDto.Request.class);
		String requestJson = objectMapper.writeValueAsString(requestDto);
		StoreAddDto.Response responseDto = easyRandom.nextObject(StoreAddDto.Response.class);
		String responseJson = objectMapper.writeValueAsString(responseDto);

		doReturn(responseDto).when(storeFacade).add(any(), any());

		//expected
		mockMvc.perform(MockMvcRequestBuilders.post("/stores")
				.contentType(MediaType.APPLICATION_JSON)
				.sessionAttr(SessionConstant.MEMBER_ID.name(), 1L)
				.content(requestJson)
			)
			.andExpect(MockMvcResultMatchers.status().isCreated())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	@Test
	@DisplayName("식당 조회 요청이 성공하면 식당 정보와 상태코드를 반환한다.")
	void findStoreSuccess() throws Exception {
		//given
		EasyRandom easyRandom = getStoreDtoEasyRandom(2L);
		StoreFindDto.Response responseDto = easyRandom.nextObject(StoreFindDto.Response.class);
		String responseJson = objectMapper.writeValueAsString(responseDto);

		doReturn(responseDto).when(storeFacade).find(2L);

		//expected
		mockMvc.perform(MockMvcRequestBuilders.get("/stores/{id}", 2L)
				.contentType(MediaType.APPLICATION_JSON)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	// TODO: 2024-01-07 성능 측정 후, 페이징 기능으로 변경
	@Test
	@DisplayName("식당 이름으로 조회 요청이 성공하면 해당 이름의 식당 목록과 상태코드를 반환한다.")
	void findStoresSuccessByName() throws Exception {
		//given
		String storeName = "store_name";
		StoreFindDto.Responses storesFindResponse = new StoreFindDto.Responses(getStoreFindResponses());
		String responseJson = objectMapper.writeValueAsString(storesFindResponse);

		doReturn(storesFindResponse).when(storeFacade).find(storeName);

		//expected
		mockMvc.perform(MockMvcRequestBuilders.get("/stores")
				.contentType(MediaType.APPLICATION_JSON)
				.queryParam("name", storeName)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	@Test
	@DisplayName("식당 페이지 조회 요청이 성공하면 페이지와 상태코드를 반환한다.")
	void findStorePageSuccess() throws Exception {
		//given
		List<StoreFindDto.Response> storeFindResponseList = getStoreFindResponses();
		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		PageImpl<StoreFindDto.Response> storeFindResponsePage = new PageImpl<>(storeFindResponseList, pageable, 1);
		String responseJson = objectMapper.writeValueAsString(storeFindResponsePage);

		doReturn(storeFindResponsePage).when(storeFacade).findPage(any(Pageable.class));

		//expected
		mockMvc.perform(MockMvcRequestBuilders.get("/stores")
				.contentType(MediaType.APPLICATION_JSON)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	@Test // TODO: 2024-01-07 페이징 기능과 비교후 제거
	@DisplayName("식당 전체 목록 조회에 성공하면 목록과 상태코드를 반환한다.")
	void findAllSuccess() throws Exception {
		//given
		StoreFindDto.Responses storesFindResponse = new StoreFindDto.Responses(getStoreFindResponses());
		String responseJson = objectMapper.writeValueAsString(storesFindResponse);

		doReturn(storesFindResponse).when(storeFacade).findAll();

		//expected
		mockMvc.perform(MockMvcRequestBuilders.get("/stores/all")
				.contentType(MediaType.APPLICATION_JSON)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	@Test
	@DisplayName("수정 요청이 성공적으로 수행되면, 상태코드와 함께 응답을 반환한다.")
	void updateStoreSuccess() throws Exception {
		//given
		EasyRandom easyRandom = getStoreDtoEasyRandom(2L);
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);
		String requestJson = objectMapper.writeValueAsString(storeUpdateRequest);
		StoreUpdateDto.Response storeUpdateResponse = easyRandom.nextObject(StoreUpdateDto.Response.class);
		String responseJson = objectMapper.writeValueAsString(storeUpdateResponse);

		doReturn(storeUpdateResponse).when(storeFacade).update(any(), any());

		//when
		mockMvc.perform(MockMvcRequestBuilders.put("/stores/{id}", 2L)
				.contentType(MediaType.APPLICATION_JSON)
				.sessionAttr(SessionConstant.MEMBER_ID.name(), 1L)
				.content(requestJson)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	@Test
	@DisplayName("삭제 요청이 성공적으로 수행되면, 상태코드를 반환한다.")
	void deleteStoreSuccess() throws Exception {
		//expected
		mockMvc.perform(MockMvcRequestBuilders.delete("/stores/{id}", 2L)
				.contentType(MediaType.APPLICATION_JSON)
				.sessionAttr(SessionConstant.MEMBER_ID.name(), 1L)
			)
			.andExpect(MockMvcResultMatchers.status().isNoContent());
	}

	private EasyRandom getStoreDtoEasyRandom(Long storeId) {
		EasyRandomParameters conditions = getStoreDtoConditions(storeId);
		return new EasyRandom(conditions);
	}

	private EasyRandomParameters getStoreDtoConditions(Long id) {
		return new EasyRandomParameters()
			.randomize(named("id"), () -> id)
			.randomize(named("name"), () -> "store_name")
			.randomize(named("description"), () -> "store_description")
			.randomize(named("maxWaitingCount"), new IntegerRangeRandomizer(1, 50));
	}

	private List<StoreFindDto.Response> getStoreFindResponses() {
		EasyRandom storeARandom = getStoreDtoEasyRandom(2L);
		EasyRandom storeBRandom = getStoreDtoEasyRandom(3L);
		StoreFindDto.Response storeFindResponseA = storeARandom.nextObject(StoreFindDto.Response.class);
		StoreFindDto.Response storeFindResponseB = storeBRandom.nextObject(StoreFindDto.Response.class);

		List<StoreFindDto.Response> storeFindResponseList = new ArrayList<>();
		storeFindResponseList.add(storeFindResponseA);
		storeFindResponseList.add(storeFindResponseB);
		return storeFindResponseList;
	}
}

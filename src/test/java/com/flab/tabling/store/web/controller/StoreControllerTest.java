package com.flab.tabling.store.web.controller;

import static org.jeasy.random.FieldPredicates.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.jeasy.random.randomizers.range.IntegerRangeRandomizer;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.facade.StoreFacade;

/*
@ExtendWith: Junit의 확장기능, mock 객체를 사용하기 위해 mockito 확장
 */
@ExtendWith(MockitoExtension.class)
class StoreControllerTest {
	@InjectMocks
	private StoreController storeController;
	@Mock
	private StoreFacade storeFacade;
	private MockMvc mockMvc;
	private ObjectMapper objectMapper;

	@BeforeEach
	void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(storeController)
			.setCustomArgumentResolvers(new PageableHandlerMethodArgumentResolver())
			.build();
		objectMapper = new ObjectMapper();
	}

	@Test
	@DisplayName("식당 등록 요청이 성공하면 등록한 식당에 대한 응답과 상태코드를 반환한다.")
	void addStoreSuccess() throws Exception {
		//given
		EasyRandom easyRandom = getStoreDtoEasyRandom();
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
		EasyRandom easyRandom = getStoreDtoEasyRandom();
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

	@Test
	@DisplayName("식당 페이지 조회 요청이 성공하면 페이지와 상태코드를 반환한다.")
	void findStorePageSuccess() throws Exception {
		//given
		List<StoreFindDto.Response> storeFindResponseList = getStoreFindResponseList();
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
		StoreFindDto.Responses storesFindResponse = new StoreFindDto.Responses(getStoreFindResponseList());
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
		EasyRandom easyRandom = getStoreDtoEasyRandom();
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

	private EasyRandom getStoreDtoEasyRandom() {
		EasyRandomParameters conditions = getStoreDtoConditions();
		return new EasyRandom(conditions);
	}

	private EasyRandomParameters getStoreDtoConditions() {
		return new EasyRandomParameters()
			.randomize(named("id"), () -> 2L)
			.randomize(named("name"), () -> "식당이름")
			.randomize(named("description"), () -> "식당정보")
			.randomize(named("maxWaitingCount"), new IntegerRangeRandomizer(1, 50));
	}

	private List<StoreFindDto.Response> getStoreFindResponseList() {
		EasyRandom easyRandom = getStoreDtoEasyRandom();
		StoreFindDto.Response storeFindResponseA = easyRandom.nextObject(StoreFindDto.Response.class);
		StoreFindDto.Response storeFindResponseB = easyRandom.nextObject(StoreFindDto.Response.class);

		List<StoreFindDto.Response> storeFindResponseList = new ArrayList<>();
		storeFindResponseList.add(storeFindResponseA);
		storeFindResponseList.add(storeFindResponseB);
		return storeFindResponseList;
	}
}

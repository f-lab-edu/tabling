package com.flab.tabling.store.web.controller;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.jeasy.random.FieldPredicates;
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
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.service.StoreService;

/*
@ExtendWith: Junit의 확장기능, mock 객체를 사용하기 위해 mockito 확장
 */
@ExtendWith(MockitoExtension.class)
class StoreControllerTest {
	@InjectMocks
	private StoreController storeController;
	@Mock
	private StoreService storeService;
	private MockMvc mockMvc;
	private ObjectMapper objectMapper;
	private EasyRandom easyRandom = new EasyRandom();

	@BeforeEach
	void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(storeController)
			.setCustomArgumentResolvers(new PageableHandlerMethodArgumentResolver())
			.build();
		objectMapper = new ObjectMapper();
	}
  
  @DisplayName("올바른 정보로 식당등록을 요청하면 성공적으로 수행된다.")
	void addStoreSuccess() throws Exception {
		//given
		EasyRandomParameters conditions = getStoreDtoConditions();
		EasyRandom easyRandom = new EasyRandom(conditions);

		StoreAddDto.Request requestDto = easyRandom.nextObject(StoreAddDto.Request.class);
		String requestJson = objectMapper.writeValueAsString(requestDto);

		StoreAddDto.Response responseDto = easyRandom.nextObject(StoreAddDto.Response.class);
		String responseJson = objectMapper.writeValueAsString(responseDto);

		doReturn(responseDto).when(storeService)
			.add(any(StoreAddDto.Request.class), eq(1L));

		//expected
		mockMvc.perform(MockMvcRequestBuilders.post("/stores")
				.contentType(MediaType.APPLICATION_JSON)
				.sessionAttr("LOGIN_SESSION", 1L) // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체
				.content(requestJson)
			)
			.andExpect(MockMvcResultMatchers.status().isCreated())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}
  
	@Test
	@DisplayName("식당 조회에 성공하면 식당 정보와 응답코드를 반환한다.")
	void findStoreSuccess() throws Exception {
		//given
		StoreFindDto.Response responseDto = easyRandom.nextObject(StoreFindDto.Response.class);
		String responseJson = objectMapper.writeValueAsString(responseDto);

		doReturn(responseDto).when(storeService).find(2L);

		//expected
		mockMvc.perform(MockMvcRequestBuilders.get("/stores/{id}", 2L)
				.contentType(MediaType.APPLICATION_JSON)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	@Test
	@DisplayName("식당 페이지 조회에 성공하면 페이지와 응답코드를 반환한다.")
	void findStorePageSuccess() throws Exception {
		//given
		List<StoreFindDto.Response> storeFindResponseList = getStoreFindResponseList();
		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		PageImpl<StoreFindDto.Response> storeFindResponsePage = new PageImpl<>(storeFindResponseList, pageable, 1);
		String responseJson = objectMapper.writeValueAsString(storeFindResponsePage);

		doReturn(storeFindResponsePage).when(storeService).findPage(any(Pageable.class));

		//expected
		mockMvc.perform(MockMvcRequestBuilders.get("/stores")
				.contentType(MediaType.APPLICATION_JSON)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}
  
  private EasyRandomParameters getStoreDtoConditions() {
		return new EasyRandomParameters()
			.stringLengthRange(2, 20)
			.randomize(FieldPredicates.named("id"), () -> 2L)
			.randomize(FieldPredicates.named("maxWaitingCount"), new IntegerRangeRandomizer(1, 50));

	private List<StoreFindDto.Response> getStoreFindResponseList() {
		StoreFindDto.Response storeFindResponseA = easyRandom.nextObject(StoreFindDto.Response.class);
		StoreFindDto.Response storeFindResponseB = easyRandom.nextObject(StoreFindDto.Response.class);

		List<StoreFindDto.Response> storeFindResponseList = new ArrayList<>();
		storeFindResponseList.add(storeFindResponseA);
		storeFindResponseList.add(storeFindResponseB);
		return storeFindResponseList;
	}
}

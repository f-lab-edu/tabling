package com.flab.tabling.store.web.controller;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.service.StoreCrudService;

/*
@ExtendWith: Junit의 확장기능, mock 객체를 사용하기 위해 mockito 확장
 */
@ExtendWith(MockitoExtension.class)
class StoreCrudControllerTest {

	@InjectMocks
	private StoreCrudController storeCrudController;

	@Mock
	private StoreCrudService storeCrudService;

	private MockMvc mockMvc;

	private ObjectMapper objectMapper;

	@BeforeEach
	void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(storeCrudController).build();
		objectMapper = new ObjectMapper();
	}

	@Test
	@DisplayName("올바른 정보로 식당등록을 요청하면 성공적으로 수행된다.")
	void addStoreSuccess() throws Exception {
		//given
		EasyRandomParameters conditions = new EasyRandomParameters().stringLengthRange(2, 10);
		EasyRandom easyRandom = new EasyRandom(conditions);

		StoreAddDto.Request requestDto = easyRandom.nextObject(StoreAddDto.Request.class);
		String requestJson = objectMapper.writeValueAsString(requestDto);

		StoreAddDto.Response responseDto = easyRandom.nextObject(StoreAddDto.Response.class);
		String responseJson = objectMapper.writeValueAsString(responseDto);

		doReturn(responseDto).when(storeCrudService)
			.add(any(StoreAddDto.Request.class), eq(1L));

		//expected
		mockMvc.perform(MockMvcRequestBuilders.post("/stores")
				.contentType(MediaType.APPLICATION_JSON)
				.sessionAttr("LOGIN_SESSION", 1L) // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체
				.content(requestJson)
			)
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}
}

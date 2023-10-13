package com.flab.tabling.store.web.controller;

import static org.mockito.Mockito.*;

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
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.service.StoreUpdateService;

@ExtendWith(MockitoExtension.class)
class StoreControllerTest {
	@InjectMocks
	private StoreController storeController;
	@Mock
	private StoreUpdateService storeUpdateService;
	private MockMvc mockMvc;
	private ObjectMapper objectMapper;

	@BeforeEach
	void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(storeController).build();
		objectMapper = new ObjectMapper();
	}

	@Test
	@DisplayName("수정 요청이 성공하면 상태코드와 함께 응답을 전송한다.")
	void updateStoreSuccess() throws Exception {
		//given
		EasyRandomParameters conditions = getStoreDtoConditions();
		EasyRandom easyRandom = new EasyRandom(conditions);

		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);
		String requestJson = objectMapper.writeValueAsString(storeUpdateRequest);

		StoreUpdateDto.Response storeUpdateResponse = easyRandom.nextObject(StoreUpdateDto.Response.class);
		String responseJson = objectMapper.writeValueAsString(storeUpdateResponse);

		doReturn(storeUpdateResponse).when(storeUpdateService).update(any(StoreUpdateDto.Request.class), eq(1L));

		//when
		mockMvc.perform(MockMvcRequestBuilders.put("/stores/{id}", 2L)
				.contentType(MediaType.APPLICATION_JSON)
				.sessionAttr("LOGIN_SESSION", 1L) // TODO: 2023-10-13 세션 이름 변경 필요
				.content(requestJson)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	private EasyRandomParameters getStoreDtoConditions() {
		return new EasyRandomParameters()
			.stringLengthRange(2, 20)
			.randomize(FieldPredicates.named("id"), () -> 2L)
			.randomize(FieldPredicates.named("maxWaitingCount"), new IntegerRangeRandomizer(1, 50));
	}
}

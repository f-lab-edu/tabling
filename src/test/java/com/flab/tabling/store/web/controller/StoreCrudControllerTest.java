package com.flab.tabling.store.web.controller;

import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

import org.jeasy.random.EasyRandom;
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
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.service.StoreQueryService;

/*
@ExtendWith: Junit의 확장기능, mock 객체를 사용하기 위해 mockito 확장
 */
@ExtendWith(MockitoExtension.class)
class StoreCrudControllerTest {

	@InjectMocks
	private StoreCrudController storeCrudController;
	@Mock
	private StoreQueryService storeQueryService;
	private MockMvc mockMvc;
	private ObjectMapper objectMapper;
	private EasyRandom easyRandom = new EasyRandom();

	@BeforeEach
	void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(storeCrudController)
			.setCustomArgumentResolvers(new PageableHandlerMethodArgumentResolver())
			.build();
		objectMapper = new ObjectMapper();
	}

	@Test
	@DisplayName("식당 조회에 성공하면 식당 정보와 응답코드를 반환한다.")
	void findStoreSuccess() throws Exception {
		//given
		StoreFindDto.Response responseDto = easyRandom.nextObject(StoreFindDto.Response.class);
		String responseJson = objectMapper.writeValueAsString(responseDto);

		doReturn(responseDto).when(storeQueryService).find(2L);

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

		doReturn(storeFindResponsePage).when(storeQueryService).findPage(any(Pageable.class));

		//expected
		mockMvc.perform(MockMvcRequestBuilders.get("/stores")
				.contentType(MediaType.APPLICATION_JSON)
			)
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().json(responseJson));
	}

	private List<StoreFindDto.Response> getStoreFindResponseList() {
		StoreFindDto.Response storeFindResponseA = easyRandom.nextObject(StoreFindDto.Response.class);
		StoreFindDto.Response storeFindResponseB = easyRandom.nextObject(StoreFindDto.Response.class);

		List<StoreFindDto.Response> storeFindResponseList = new ArrayList<>();
		storeFindResponseList.add(storeFindResponseA);
		storeFindResponseList.add(storeFindResponseB);
		return storeFindResponseList;
	}
}

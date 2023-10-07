package com.flab.tabling.store.web.config;

import static org.mockito.Mockito.*;

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
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.flab.tabling.store.web.controller.StoreCrudController;
import com.flab.tabling.store.web.interceptor.StoreAuthInterceptor;

@ExtendWith(MockitoExtension.class)
class StoreWebConfigTest {
	@InjectMocks
	private StoreCrudController storeCrudController;
	@Mock
	private StoreAuthInterceptor storeAuthInterceptor;
	private MockMvc mockMvc;

	@BeforeEach
	void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(storeCrudController).addInterceptors(storeAuthInterceptor).build();
	}

	@Test
	@DisplayName("/stores/** 해당 경로로 접근하면 StoreAuthInterceptor가 적용된다.")
	void addInterceptors() throws Exception {
		//when
		mockMvc.perform(MockMvcRequestBuilders.post("/stores")
			.contentType(MediaType.APPLICATION_JSON)
			.sessionAttr("LOGIN_SESSION", 1L) // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체
		);

		//then
		verify(storeAuthInterceptor, times(1)).preHandle(any(), any(), any());
	}
}

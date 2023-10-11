package com.flab.tabling.global.auth;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.global.exception.ErrorResponse;
import com.flab.tabling.member.controller.MemberController;

@ExtendWith(MockitoExtension.class)
class AuthenticationFilterTest {
	@InjectMocks
	private AuthenticationFilter authenticationFilter;

	@InjectMocks
	private ExceptionHandlerFilter exceptionHandlerFilter;

	@Mock
	private MemberController memberController;

	ObjectMapper objectMapper = new ObjectMapper();

	private MockMvc mvc;

	@BeforeEach
	void init() {
		mvc = MockMvcBuilders.standaloneSetup(memberController)
			.addFilter(exceptionHandlerFilter)
			.addFilter(authenticationFilter)
			.build();
	}

	@DisplayName("인증해야 하는 URI 접근 테스트 : 상태코드 401")
	@Test
	void failWithUnAuthenticated() throws Exception {
		//given
		ErrorResponse errorResponse = ErrorResponse
			.builder()
			.code(ErrorCode.AUTHENTICATION_FAILED)
			.message(ErrorCode.AUTHENTICATION_FAILED.getMessage())
			.build();

		//when
		ResultActions resultActions = mvc.perform(
			delete("/logout")
				.contentType(MediaType.APPLICATION_JSON));
		//then
		MockHttpServletResponse response = resultActions.andExpect(status().is(401))
			.andReturn().getResponse();
		ErrorResponse memberResponseDtoResult = objectMapper.readValue(response.getContentAsString(),
			ErrorResponse.class);
		Assertions.assertThat(memberResponseDtoResult).usingRecursiveComparison().isEqualTo(errorResponse);
	}
}

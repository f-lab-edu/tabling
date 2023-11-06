package com.flab.tabling.member.controller;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
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
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.MethodArgumentNotValidException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.global.service.StringGenerateFixture;
import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.member.dto.MemberAuthDto;
import com.flab.tabling.member.service.AuthService;

@ExtendWith(MockitoExtension.class)
class AuthControllerTest {
	@InjectMocks
	private AuthController authController;
	@Mock
	private AuthService authService;
	private MockMvc mvc;
	ObjectMapper objectMapper = new ObjectMapper();
	private MockHttpSession session = new MockHttpSession();

	@BeforeEach
	void init() {
		mvc = MockMvcBuilders.standaloneSetup(authController)
			.build();
	}
	
	@DisplayName("로그인 성공 테스트")
	@Test
	void loginSuccess() throws Exception {
		//given
		String email = StringGenerateFixture.makeEmail(10);
		String password = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		MemberAuthDto.Request memberRequestDto = MemberAuthDto.Request
			.builder()
			.email(email)
			.password(password)
			.build();

		//when
		MemberAuthDto.Response memberResponseDto = new MemberAuthDto.Response(1L);
		doReturn(memberResponseDto).when(authService).login(any(), any());
		MockHttpServletResponse response = mvc.perform(post("/login")
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(memberRequestDto)))
			.andExpect(status().isOk())
			.andReturn().getResponse();
		MemberAuthDto.Response result = objectMapper.readValue(response.getContentAsString(),
			MemberAuthDto.Response.class);

		//then
		assertThat(result).usingRecursiveComparison().isEqualTo(memberResponseDto);
	}

	@DisplayName("로그인 : 유효하지 않은 이메일 테스트")
	@Test
	void loginFailureByEmail() throws Exception {
		//given
		String email = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		String password = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		MemberAuthDto.Request memberRequestDto = MemberAuthDto.Request
			.builder()
			.email(email)
			.password(password)
			.build();

		//when, then
		mvc.perform(post("/login")
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(memberRequestDto)))
			.andExpect(status().isBadRequest())
			.andExpect(result -> assertThat(
				result.getResolvedException() instanceof MethodArgumentNotValidException).isTrue());
	}

	@DisplayName("로그인 : 유효하지 않은 비밀번호 테스트")
	@Test
	void loginFailureByPassword() throws Exception {
		//given
		String email = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		String password = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		MemberAuthDto.Request memberRequestDto = MemberAuthDto.Request
			.builder()
			.email(email)
			.password(password)
			.build();

		//when, then
		mvc.perform(post("/login")
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(memberRequestDto)))
			.andExpect(status().isBadRequest())
			.andExpect(result -> assertThat(
				result.getResolvedException() instanceof MethodArgumentNotValidException).isTrue());
	}

	@DisplayName("로그아웃 : 세션 무효화 테스트")
	@Test
	void logoutSucess() throws Exception {
		Long memberId = 1L;
		session.setAttribute(SessionConstant.MEMBER_ID.name(), memberId);
		mvc.perform(delete("/logout")
				.session(session))
			.andExpect(status().isOk());
		Assertions.assertThat(session.isInvalid()).isTrue();
	}

}

package com.flab.tabling.member.controller;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.web.bind.MethodArgumentNotValidException;

import com.flab.tabling.global.config.AbstractRestDocsTest;
import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.global.service.StringGenerateFixture;
import com.flab.tabling.member.dto.MemberAuthDto;
import com.flab.tabling.member.facade.AuthFacade;

/**
 * @AutoConfigureMockMvc : WebApplicationContext 주입
 * @AutoConfigureRestDocs : apply(documentationConfiguration(restDocumentation)) 문서화
 */

@WebMvcTest(controllers = {AuthController.class})
class AuthControllerRestDocsTest extends AbstractRestDocsTest {
	@MockBean
	AuthFacade authFacade;
	private MockHttpSession session = new MockHttpSession();

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
		doReturn(memberResponseDto).when(authFacade).login(any(), any());
		MockHttpServletResponse response = mockMvc.perform(post("/login")
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
		mockMvc.perform(post("/login")
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
		mockMvc.perform(post("/login")
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(memberRequestDto)))
			.andExpect(status().isBadRequest())
			.andExpect(result -> assertThat(
				result.getResolvedException() instanceof MethodArgumentNotValidException).isTrue());
	}

	@DisplayName("로그아웃 : 세션 무효화 테스트")
	@Test
	void logoutSuccess() throws Exception {
		Long memberId = 1L;
		session.setAttribute(SessionConstant.MEMBER_ID.name(), memberId);
		MockHttpServletResponse response = mockMvc.perform(delete("/logout")
				.contentType(MediaType.APPLICATION_JSON)
				.session(session))
			.andExpect(status().isOk())
			.andReturn().getResponse();
		MemberAuthDto.Response result = objectMapper.readValue(response.getContentAsString(),
			MemberAuthDto.Response.class);
		assertThat(result).usingRecursiveComparison().isEqualTo(new MemberAuthDto.Response(1L));
		Assertions.assertThat(session.isInvalid()).isTrue();
	}
}

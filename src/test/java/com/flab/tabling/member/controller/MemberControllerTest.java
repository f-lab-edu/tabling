package com.flab.tabling.member.controller;

import static org.mockito.BDDMockito.*;
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
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.global.exception.ErrorResponse;
import com.flab.tabling.global.exception.GlobalExceptionAdvice;
import com.flab.tabling.global.service.StringGenerateFixture;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.facade.MemberFacade;

import jakarta.servlet.http.HttpSession;

/**
 * @WebMvcTest : 웹 계층과 관련된 빈들만을 찾아서 빈으로 등록 @RestController,  @RestControllerAdvice, WebMvcConfigurer, HandlerMethodArgumentResolver
 * @MockBean : 가짜 객체인 Mock 객체를 빈으로 등록, main 클래스의 @EnableJpaAuditing JpaMetamodelMappingContext.class 빈 등록
 * @Autowired : 의존성 주입, 필드 주입, 수정자 주입, 생성자 주입 방식이 있고 생성자가 1개일 경우 생략될 수 있다. 필드 주입은 권장되지 않으나 테스트코드에서는
 * 필드 주입을 통해서 Jupiter가 스프링 컨테이너에 요청하게 되어서 정상적으로 빈 주입을 받을 수 있게 된다.
 * @AutoConfigureMockMvc : addFilters = false로 해서 Filter 없이 MockMvc auto-configuration을 설정했다.
 */

@ExtendWith(MockitoExtension.class)
class MemberControllerTest {
	private final String postURI = "/members";

	@InjectMocks
	private MemberController memberController;
	@Mock
	private MemberFacade memberFacade;
	private MockMvc mvc;
	ObjectMapper objectMapper = new ObjectMapper();
	private MockHttpSession session = new MockHttpSession();

	@BeforeEach
	void init() {
		mvc = MockMvcBuilders.standaloneSetup(memberController)
			.setControllerAdvice(new GlobalExceptionAdvice())
			.build();
	}

	@DisplayName("회원가입")
	@Test
	void addUser() throws Exception {
		//given
		String name = StringGenerateFixture.makeByNumbersAndLowerLetters(8);
		String password = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		RoleType roleType = RoleType.CUSTOMER;
		String email = StringGenerateFixture.makeEmail(8);

		MemberAddDto.Request memberRequestDto = MemberAddDto.Request
			.builder()
			.name(name)
			.password(password)
			.email(email)
			.roleType(roleType)
			.build();
		MemberAddDto.Response memberResponseDto = new MemberAddDto.Response(1L);

		given(memberFacade.add(any(MemberAddDto.Request.class), any(HttpSession.class)))
			.willReturn(memberResponseDto);

		//when
		ResultActions resultActions = mvc.perform(
			post(postURI)
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(memberRequestDto)));

		//then
		MockHttpServletResponse response = resultActions.andExpect(status().isCreated())
			.andReturn().getResponse();
		MemberAddDto.Response memberResponseDtoResult = objectMapper.readValue(response.getContentAsString(),
			MemberAddDto.Response.class);
		Assertions.assertThat(memberResponseDtoResult).usingRecursiveComparison().isEqualTo(memberResponseDto);
	}

	@DisplayName("name 30자 이상 시 예외 발생")
	@Test
	void checkInvalidPassword() throws Exception {
		//given
		String name = StringGenerateFixture.makeByNumbersAndAlphabets(32);
		String password = StringGenerateFixture.makeByNumbersAndAlphabets(10);
		RoleType roleType = RoleType.CUSTOMER;
		String email = StringGenerateFixture.makeEmail(8);

		MemberAddDto.Request memberRequestDto = MemberAddDto.Request
			.builder()
			.name(name)
			.password(password)
			.email(email)
			.roleType(roleType)
			.build();
		//when
		ResultActions resultActions = mvc.perform(
			post(postURI)
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(memberRequestDto)));
		//then
		MockHttpServletResponse response = resultActions.andExpect(status().isBadRequest())
			.andReturn().getResponse();
		ErrorResponse memberResponseDtoResult = objectMapper.readValue(response.getContentAsString(),
			ErrorResponse.class);
		Assertions.assertThat(memberResponseDtoResult.getCode()).isEqualTo(ErrorCode.INVALID_PARAMETER);
	}
}

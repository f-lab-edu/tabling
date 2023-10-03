package com.flab.tabling.member.controller;

import static org.mockito.BDDMockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.jpa.mapping.JpaMetamodelMappingContext;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.flab.tabling.global.config.StringGenerateFixture;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.service.MemberRegisterService;

@WebMvcTest(MemberController.class)
@MockBean(JpaMetamodelMappingContext.class)
@AutoConfigureMockMvc(addFilters = false)
class MemberControllerTest {
	private final String postURI = "/members";

	@MockBean
	private MemberRegisterService memberRegisterService;

	@Autowired
	private MockMvc mvc;
	ObjectMapper objectMapper = new ObjectMapper();

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
		MemberAddDto.Response memberResponseDto = MemberAddDto.Response
			.builder()
			.id(1L)
			.build();

		given(memberRegisterService.add(any(MemberAddDto.Request.class)))
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

}

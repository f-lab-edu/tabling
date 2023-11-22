package com.flab.tabling.waiting.controller;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;

import com.flab.tabling.global.config.AbstractRestDocsTest;
import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.waiting.dto.WaitingAddDto;
import com.flab.tabling.waiting.facade.WaitingFacade;

@WebMvcTest(WaitingController.class)
class WaitingControllerTest extends AbstractRestDocsTest {
	@MockBean
	WaitingFacade waitingFacade;

	private MockHttpSession session = new MockHttpSession();

	@Test
	@DisplayName("사용자 식당 대기 신청 성공")
	void addMySelf() throws Exception {
		//given
		WaitingAddDto.Request waitingRequestDto = new WaitingAddDto.Request(3);
		session.setAttribute(SessionConstant.MEMBER_ID.name(), 3L);

		//when
		WaitingAddDto.Response waitingResponseDto = new WaitingAddDto.Response(13L);
		doReturn(waitingResponseDto).when(waitingFacade).addMember(any(), any(), any());
		MockHttpServletResponse response = mockMvc.perform(post("/stores/1/waiting")
				.session(session)
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(waitingRequestDto)))
			.andExpect(status().isCreated())
			.andReturn().getResponse();
		WaitingAddDto.Response result = objectMapper.readValue(response.getContentAsString(),
			WaitingAddDto.Response.class);

		//then
		assertThat(result).usingRecursiveComparison().isEqualTo(waitingResponseDto);
	}

	@Test
	@DisplayName("사용자 식당 대기 취소 성공")
	void cancelMyself() throws Exception {
		//given
		session.setAttribute(SessionConstant.MEMBER_ID.name(), 3L);

		//when, then
		mockMvc.perform(delete("/stores/{id}/waiting", 2L)
				.session(session)
				.contentType(MediaType.APPLICATION_JSON))
			.andExpect(status().isNoContent());
	}

	@Test
	void acceptFirstOfStore() throws Exception {
		//given
		session.setAttribute(SessionConstant.MEMBER_ID.name(), 3L);

		//when
		WaitingAddDto.Response waitingResponseDto = new WaitingAddDto.Response(13L);
		doReturn(waitingResponseDto).when(waitingFacade).addMember(any(), any(), any());
		mockMvc.perform(post("/stores/{id}/orders", 2L)
				.session(session)
				.contentType(MediaType.APPLICATION_JSON))
			.andExpect(status().isNoContent())
			.andReturn().getResponse();
	}

	@Test
	void cancelFirstOfStore() throws Exception {
		//given
		session.setAttribute(SessionConstant.MEMBER_ID.name(), 3L);

		//when
		WaitingAddDto.Response waitingResponseDto = new WaitingAddDto.Response(13L);
		doReturn(waitingResponseDto).when(waitingFacade).addMember(any(), any(), any());
		mockMvc.perform(delete("/stores/{id}/orders", 2L)
				.session(session)
				.contentType(MediaType.APPLICATION_JSON))
			.andExpect(status().isNoContent())
			.andReturn().getResponse();
	}
}

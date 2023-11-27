package com.flab.tabling.businesshour.controller;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;

import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryServiceImpl;
import com.flab.tabling.global.config.AbstractRestDocsTest;

@WebMvcTest(BusinessHourController.class)
class BusinessHourControllerRestDocsTest extends AbstractRestDocsTest {
	@MockBean
	private BusinessHourQueryServiceImpl businessHourQueryService;
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();

	@Test
	@DisplayName("특정 식당의 운영 시간 조회에 성공하면 상태코드와 응답을 반환한다.")
	void successFindPage() throws Exception {
		//given
		List<BusinessHourFindDto.Response> businessHourFindResponses = getBusinessHourFindResponses();
		String responseJson = objectMapper.registerModule(new JavaTimeModule())
			.writeValueAsString(businessHourFindResponses);

		doReturn(businessHourFindResponses).when(businessHourQueryService).find(2L);

		//expected
		mockMvc.perform(get("/stores/{storeId}/business-hours", 2L)
				.contentType(MediaType.APPLICATION_JSON)
			).andExpect(status().isOk())
			.andExpect(content().json(responseJson));
	}

	private List<BusinessHourFindDto.Response> getBusinessHourFindResponses() {
		return businessHourFixture.getBusinessHoursWithBreakTime(2L, 8, 15, 18, 22).stream()
			.map(BusinessHourFindDto.Response::new)
			.toList();
	}
}

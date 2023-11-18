package com.flab.tabling.businesshour.controller;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;

import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryServiceImpl;
import com.flab.tabling.global.config.AbstractRestDocsTest;

@WebMvcTest(BusinessHourController.class)
class BusinessHourControllerRestDocsTest extends AbstractRestDocsTest {
	@MockBean
	private BusinessHourQueryServiceImpl businessHourQueryService;
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();

	@Test
	@DisplayName("운영 시간 단건 조회에 성공하면 상태코드와 응답을 반환한다.")
	void successFind() throws Exception {
		//given
		BusinessHourFindDto.Response businessHourFindResponse = getBusinessHourFindResponse(3L);
		String responseJson = objectMapper.registerModule(new JavaTimeModule())
			.writeValueAsString(businessHourFindResponse);

		doReturn(businessHourFindResponse).when(businessHourQueryService).find(3L);

		//expected
		mockMvc.perform(get("/business-hours/{id}", 3L)
				.contentType(MediaType.APPLICATION_JSON)
			).andExpect(status().isOk())
			.andExpect(content().json(responseJson));
	}

	@Test
	@DisplayName("운영 시간 페이지 조회에 성공하면 상태코드와 응답을 반환한다.")
	void successFindPage() throws Exception {
		//given
		Page<BusinessHourFindDto.Response> businessHourFindResponsePage = getBusinessHourFindResponsePage();
		String responseJson = objectMapper.registerModule(new JavaTimeModule())
			.writeValueAsString(businessHourFindResponsePage);

		doReturn(businessHourFindResponsePage).when(businessHourQueryService)
			.findPage(any(BusinessHourFindDto.Request.class), any(Pageable.class));

		//expected
		mockMvc.perform(get("/business-hours")
				.contentType(MediaType.APPLICATION_JSON)
				.queryParam("storeId", "2")
				.queryParam("dayOfWeek", "TUESDAY")
			).andExpect(status().isOk())
			.andExpect(content().json(responseJson));
	}

	private BusinessHourFindDto.Response getBusinessHourFindResponse(Long id) {
		return new BusinessHourFindDto.Response(businessHourFixture.getBusinessHour(id, 2L));
	}

	private Page<BusinessHourFindDto.Response> getBusinessHourFindResponsePage() {
		List<BusinessHour> businessHourList = businessHourFixture.getBusinessHoursWithOneStore(2L, 8, 15, 18, 22);
		return new PageImpl<>(businessHourList, PageRequest.of(0, 10), 1).map(BusinessHourFindDto.Response::new);
	}
}

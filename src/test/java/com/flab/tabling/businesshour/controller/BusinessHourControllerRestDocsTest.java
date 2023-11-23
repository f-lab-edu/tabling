package com.flab.tabling.businesshour.controller;

import static org.jeasy.random.FieldPredicates.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.List;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;

import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.businesshour.dto.BusinessHourAddDto;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryServiceImpl;
import com.flab.tabling.businesshour.service.BusinessHourService;
import com.flab.tabling.global.config.AbstractRestDocsTest;

@WebMvcTest(BusinessHourController.class)
class BusinessHourControllerRestDocsTest extends AbstractRestDocsTest {
	@MockBean
	private BusinessHourService businessHourService;
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

	@Test
	@DisplayName("운영 시간 수정에 성공하면 상태코드와 응답을 반환한다.")
	void successUpdate() throws Exception {
		//given
		BusinessHourUpdateDto.Request businessHourUpdateRequest = getBusinessHourUpdateRequest();
		BusinessHourUpdateDto.Response businessHourUpdateResponse = new BusinessHourUpdateDto.Response(3L);
		String requestJson = objectMapper.registerModule(new JavaTimeModule())
			.writeValueAsString(businessHourUpdateRequest);
		String responseJson = objectMapper.registerModule(new JavaTimeModule())
			.writeValueAsString(businessHourUpdateResponse);

		doReturn(businessHourUpdateResponse).when(businessHourService)
			.update(any(BusinessHourUpdateDto.Request.class), eq(1L));

		//expected
		mockMvc.perform(put("/business-hours")
				.contentType(MediaType.APPLICATION_JSON)
				.content(requestJson)
				.sessionAttr("MEMBER_ID", 1L)
			).andExpect(status().isOk())
			.andExpect(content().json(responseJson));
	}

	@Test
	@DisplayName("운영 시간 삭제에 성공하면 상태코드를 반환한다.")
	void successDelete() throws Exception {
		//expected
		mockMvc.perform(delete("/business-hours/{id}", 3L)
			.contentType(MediaType.APPLICATION_JSON)
			.sessionAttr("MEMBER_ID", 1L)
		).andExpect(status().isNoContent());
	}

	private BusinessHourAddDto.Request getBusinessHourAddRequest() {
		EasyRandomParameters requestParameters = new EasyRandomParameters()
			.randomize(named("storeId"), () -> 2L)
			.randomize(named("dayOfWeek"), () -> DayOfWeek.TUESDAY)
			.randomize(named("startTime"), () -> LocalTime.of(9, 0))
			.randomize(named("endTime"), () -> LocalTime.of(18, 0));
		return new EasyRandom(requestParameters).nextObject(BusinessHourAddDto.Request.class);
	}

	private List<BusinessHourFindDto.Response> getBusinessHourFindResponses() {
		return businessHourFixture.getBusinessHoursWithBreakTime(2L, 8, 15, 18, 22).stream()
			.map(BusinessHourFindDto.Response::new)
			.toList();
	}

	private BusinessHourUpdateDto.Request getBusinessHourUpdateRequest() {
		EasyRandomParameters requestParameters = new EasyRandomParameters()
			.randomize(named("id"), () -> 3L)
			.randomize(named("dayOfWeek"), () -> DayOfWeek.TUESDAY)
			.randomize(named("startTime"), () -> LocalTime.of(9, 0))
			.randomize(named("endTime"), () -> LocalTime.of(18, 0));
		return new EasyRandom(requestParameters).nextObject(BusinessHourUpdateDto.Request.class);
	}
}

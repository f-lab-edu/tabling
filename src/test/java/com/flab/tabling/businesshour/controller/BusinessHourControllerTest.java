package com.flab.tabling.businesshour.controller;

import static com.flab.tabling.global.constant.SessionConstant.*;
import static org.jeasy.random.FieldPredicates.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.List;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourAddDto;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryServiceImpl;
import com.flab.tabling.businesshour.service.BusinessHourService;

@ExtendWith(MockitoExtension.class)
class BusinessHourControllerTest {
	@InjectMocks
	private BusinessHourController businessHourController;
	@Mock
	private BusinessHourService businessHourService;
	@Mock
	private BusinessHourQueryServiceImpl businessHourQueryService;
	private MockMvc mockMvc;
	private ObjectMapper objectMapper;
	private BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();

	@BeforeEach
	public void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(businessHourController)
			.setCustomArgumentResolvers(new PageableHandlerMethodArgumentResolver())
			.build();
		objectMapper = new ObjectMapper();
	}

	@Test
	@DisplayName("운영 시간 등록에 성공하면 상태코드와 응답을 반환한다.")
	void successAdd() throws Exception {
		//given
		BusinessHourAddDto.Request businessHourAddRequest = getBusinessHourAddRequest();
		BusinessHourAddDto.Response businessHourAddResponse = new BusinessHourAddDto.Response(3L);
		String requestJson = objectMapper.registerModule(new JavaTimeModule())
			.writeValueAsString(businessHourAddRequest);
		String responseJson = objectMapper.registerModule(new JavaTimeModule())
			.writeValueAsString(businessHourAddResponse);

		doReturn(businessHourAddResponse).when(businessHourService).add(any(BusinessHourAddDto.Request.class), eq(1L));

		//expected
		mockMvc.perform(post("/business-hours")
				.contentType(MediaType.APPLICATION_JSON)
				.content(requestJson)
				.sessionAttr(MEMBER_ID.name(), 1L)
			).andExpect(status().isCreated())
			.andExpect(content().json(responseJson));
	}

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

	private BusinessHourFindDto.Response getBusinessHourFindResponse(Long id) {
		return new BusinessHourFindDto.Response(businessHourFixture.getBusinessHour(id, 2L));
	}

	private Page<BusinessHourFindDto.Response> getBusinessHourFindResponsePage() {
		List<BusinessHour> businessHourList = businessHourFixture.getBusinessHoursWithOneStore(2L, 8, 15, 18, 22);
		return new PageImpl<>(businessHourList, PageRequest.of(0, 10), 1).map(BusinessHourFindDto.Response::new);
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

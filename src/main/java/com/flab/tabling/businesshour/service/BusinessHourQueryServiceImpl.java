package com.flab.tabling.businesshour.service;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.repository.BusinessHourRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusinessHourQueryServiceImpl implements BusinessHourQueryService {

	private final BusinessHourRepository businessHourRepository;

	@Override
	public List<BusinessHourFindDto.Response> find(Long storeId) {
		return businessHourRepository.findList(storeId).stream()
			.map(BusinessHourFindDto.Response::new)
			.toList();
	}

	@Override
	public boolean isBusinessHour(Long storeId, LocalDateTime requestDateTime) {
		DayOfWeek requestDayOfWeek = requestDateTime.getDayOfWeek();
		LocalTime requestTime = requestDateTime.toLocalTime();
		List<BusinessHour> targetBusinessHours = businessHourRepository.findList(storeId, requestDayOfWeek);
		return checkBusinessHour(targetBusinessHours, requestTime);
	}

	private boolean checkBusinessHour(List<BusinessHour> targetBusinessHours, LocalTime requestTime) {
		return targetBusinessHours.stream().anyMatch(businessHour -> businessHour.isBusinessHour(requestTime));
	}
}
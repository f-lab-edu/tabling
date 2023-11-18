package com.flab.tabling.businesshour.service;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.exception.BusinessHourNotFoundException;
import com.flab.tabling.businesshour.repository.BusinessHourDynamicQueryRepository;
import com.flab.tabling.businesshour.repository.BusinessHourRepository;
import com.flab.tabling.global.exception.ErrorCode;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusinessHourQueryServiceImpl implements BusinessHourQueryService {

	private final BusinessHourRepository businessHourRepository;
	private final BusinessHourDynamicQueryRepository businessHourDynamicQueryRepository;

	@Override
	public BusinessHourFindDto.Response findBusinessHour(Long id) {
		BusinessHour queriedBusinessHour = businessHourRepository.findById(id)
			.orElseThrow(() -> new BusinessHourNotFoundException(ErrorCode.BUSINESS_HOUR_NOT_FOUND,
				"business hour with this id is not found"));
		return new BusinessHourFindDto.Response(queriedBusinessHour);
	}

	@Override
	public Page<BusinessHourFindDto.Response> findBusinessHours(BusinessHourFindDto.Request businessHourFindRequest,
		Pageable pageable) {
		return businessHourDynamicQueryRepository.findBusinessHours(businessHourFindRequest.getStoreId(),
			businessHourFindRequest.getDayOfWeek(), pageable).map(BusinessHourFindDto.Response::new);
	}

	@Override
	public boolean isBusinessHour(Long storeId, LocalDateTime requestDateTime) {
		DayOfWeek requestDayOfWeek = requestDateTime.getDayOfWeek();
		LocalTime requestTime = requestDateTime.toLocalTime();
		List<BusinessHour> targetBusinessHours = businessHourRepository.findBusinessHours(storeId, requestDayOfWeek);
		return checkBusinessHour(targetBusinessHours, requestTime);
	}

	private boolean checkBusinessHour(List<BusinessHour> targetBusinessHours, LocalTime requestTime) {
		return targetBusinessHours.stream().anyMatch(businessHour -> businessHour.isBusinessHour(requestTime));
	}
}

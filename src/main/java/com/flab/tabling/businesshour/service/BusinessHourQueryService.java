package com.flab.tabling.businesshour.service;

import java.time.LocalDateTime;
import java.util.List;

import com.flab.tabling.businesshour.dto.BusinessHourFindDto;

public interface BusinessHourQueryService {
	List<BusinessHourFindDto.Response> find(Long storeId);

	boolean isBusinessHour(Long storeId, LocalDateTime requestTime);
}

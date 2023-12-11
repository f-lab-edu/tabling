package com.flab.tabling.businesshour.service;

import java.time.LocalDateTime;
import java.util.List;

import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;

public interface BusinessHourQueryService {

	BusinessHour getBusinessHour(Long id);

	List<BusinessHourFindDto.Response> find(Long storeId);

	boolean isBusinessHour(Long storeId, LocalDateTime requestTime);
}

package com.flab.tabling.businesshour.service;

import java.time.LocalDateTime;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.flab.tabling.businesshour.dto.BusinessHourFindDto;

public interface BusinessHourQueryService {
	BusinessHourFindDto.Response find(Long id);

	Page<BusinessHourFindDto.Response> findPage(BusinessHourFindDto.Request businessHourFindRequest,
		Pageable pageable);

	boolean isBusinessHour(Long storeId, LocalDateTime requestTime);
}

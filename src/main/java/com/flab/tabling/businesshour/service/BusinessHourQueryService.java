package com.flab.tabling.businesshour.service;

import java.time.LocalDateTime;

public interface BusinessHourQueryService {
	public Boolean isBusinessHour(Long storeId, LocalDateTime requestTime);
}

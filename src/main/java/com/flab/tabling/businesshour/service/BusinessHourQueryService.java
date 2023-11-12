package com.flab.tabling.businesshour.service;

import java.time.LocalDateTime;

public interface BusinessHourQueryService {
	boolean isBusinessHour(Long storeId, LocalDateTime requestTime);
}

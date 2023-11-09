package com.flab.tabling.businesshour;

import java.time.LocalDateTime;

public interface BusinessHourQueryService {
	public Boolean isBusinessHour(Long storeId, LocalDateTime requestTime);
}

package com.flab.tabling.businesshour.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourAddDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.repository.BusinessHourRepository;
import com.flab.tabling.store.domain.Store;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusinessHourService {

	private final BusinessHourRepository businessHourRepository;

	public BusinessHourAddDto.Response add(BusinessHourAddDto.Request request, Store targetStore) {
		BusinessHour businessHour = BusinessHour.builder()
			.store(targetStore)
			.dayOfWeek(request.getDayOfWeek())
			.startTime(request.getStartTime())
			.endTime(request.getEndTime())
			.build();
		BusinessHour savedBusinessHour = businessHourRepository.save(businessHour);
		return new BusinessHourAddDto.Response(savedBusinessHour.getId());
	}

	@Transactional
	public BusinessHourUpdateDto.Response update(BusinessHour businessHour, BusinessHourUpdateDto.Request request) {
		businessHour.update(
			request.getDayOfWeek(),
			request.getStartTime(),
			request.getEndTime()
		);
		return new BusinessHourUpdateDto.Response(businessHour.getId());
	}

	public void delete(BusinessHour businessHour) {
		businessHourRepository.delete(businessHour);
	}
}

package com.flab.tabling.businesshour.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourAddDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.exception.BusinessHourNotFoundException;
import com.flab.tabling.businesshour.repository.BusinessHourRepository;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.exception.StoreNotFoundException;
import com.flab.tabling.store.repository.StoreRepository;
import com.flab.tabling.store.service.StoreService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusinessHourService {

	private final BusinessHourRepository businessHourRepository;
	private final StoreRepository storeRepository;
	private final StoreService storeService;

	@Transactional
	public BusinessHourAddDto.Response add(BusinessHourAddDto.Request request, Long memberId) {
		Store targetStore = getStore(request.getStoreId());
		storeService.validateAuth(targetStore, memberId);
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
	public BusinessHourUpdateDto.Response update(BusinessHourUpdateDto.Request request, Long memberId) {
		BusinessHour businessHour = getBusinessHour(request.getId());
		storeService.validateAuth(businessHour.getStore(), memberId);
		businessHour.update(
			request.getDayOfWeek(),
			request.getStartTime(),
			request.getEndTime()
		);
		return new BusinessHourUpdateDto.Response(businessHour.getId());
	}

	@Transactional
	public void delete(Long id, Long memberId) {
		BusinessHour businessHour = getBusinessHour(id);
		storeService.validateAuth(businessHour.getStore(), memberId);
		businessHourRepository.delete(businessHour);
	}

	private Store getStore(Long id) { // TODO: 2023-11-19 서비스 계층에서만 접근할 수 있도록 인터페이스 도입 및 구분 고려
		return storeRepository.findById(id)
			.orElseThrow(() -> new StoreNotFoundException(ErrorCode.STORE_NOT_FOUND, "store is not found"));
	}

	private BusinessHour getBusinessHour(Long id) {
		return businessHourRepository.findById(id)
			.orElseThrow(() -> new BusinessHourNotFoundException(ErrorCode.BUSINESS_HOUR_NOT_FOUND,
				"business hour is not found"));
	}
}

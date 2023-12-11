package com.flab.tabling.businesshour.facade;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.businesshour.domain.BusinessHour;
import com.flab.tabling.businesshour.dto.BusinessHourAddDto;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryService;
import com.flab.tabling.businesshour.service.BusinessHourService;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.service.StoreQueryService;
import com.flab.tabling.store.service.StoreService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class BusinessHourFacade {

	private final BusinessHourService businessHourService;
	private final BusinessHourQueryService businessHourQueryService;
	private final StoreService storeService;
	private final StoreQueryService storeQueryService;

	public BusinessHourAddDto.Response add(Long memberId, BusinessHourAddDto.Request request) {
		Store targetStore = storeQueryService.getStore(request.getStoreId());
		storeService.validateAuth(targetStore, memberId);
		return businessHourService.add(request, targetStore);
	}

	public List<BusinessHourFindDto.Response> find(Long storeId) {
		return businessHourQueryService.find(storeId);
	}

	@Transactional
	public BusinessHourUpdateDto.Response update(Long id, Long memberId, BusinessHourUpdateDto.Request request) {
		BusinessHour targetBusinessHour = businessHourQueryService.getBusinessHour(id);
		storeService.validateAuth(targetBusinessHour.getStore(), memberId);
		businessHourService.update(targetBusinessHour, request);
		return new BusinessHourUpdateDto.Response(targetBusinessHour.getId());
	}

	public void delete(Long id, Long memberId) {
		BusinessHour businessHour = businessHourQueryService.getBusinessHour(id);
		storeService.validateAuth(businessHour.getStore(), memberId);
		businessHourService.delete(businessHour);
	}
}

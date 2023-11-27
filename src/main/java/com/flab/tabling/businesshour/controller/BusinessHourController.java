package com.flab.tabling.businesshour.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BusinessHourController {

	public final BusinessHourQueryService businessHourQueryService;

	@GetMapping("/stores/{storeId}/business-hours")
	public ResponseEntity<List<BusinessHourFindDto.Response>> find(@PathVariable Long storeId) {
		List<BusinessHourFindDto.Response> businessHourFindResponses = businessHourQueryService.find(storeId);
		return ResponseEntity.status(HttpStatus.OK).body(businessHourFindResponses);
	}
}

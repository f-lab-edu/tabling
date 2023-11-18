package com.flab.tabling.businesshour.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BusinessHourController {

	public final BusinessHourQueryService businessHourQueryService;

	@GetMapping("/business-hours/{id}")
	public ResponseEntity<BusinessHourFindDto.Response> find(@PathVariable Long id) {
		BusinessHourFindDto.Response businessHourFindResponse = businessHourQueryService.find(id);
		return ResponseEntity.status(HttpStatus.OK).body(businessHourFindResponse);
	}

	@GetMapping("/business-hours")
	public ResponseEntity<Page<BusinessHourFindDto.Response>> findPage(
		@ModelAttribute BusinessHourFindDto.Request businessHourFindRequest, @PageableDefault Pageable pageable) {
		Page<BusinessHourFindDto.Response> businessHourFindResonsePage = businessHourQueryService.findPage(
			businessHourFindRequest, pageable);
		return ResponseEntity.status(HttpStatus.OK).body(businessHourFindResonsePage);
	}
}

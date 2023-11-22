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

/*
@ModelAttribute: 전달된 요청 파라미터를 생성자 또는 Setter/Getter로 주입해서 객체를 자동 생성한다.
 */
@RestController
@RequiredArgsConstructor
public class BusinessHourController {

	public final BusinessHourQueryService businessHourQueryService;

	@GetMapping("/stores/business-hours/{id}")
	public ResponseEntity<BusinessHourFindDto.Response> find(@PathVariable Long id) {
		BusinessHourFindDto.Response businessHourFindResponse = businessHourQueryService.find(id);
		return ResponseEntity.status(HttpStatus.OK).body(businessHourFindResponse);
	}

	@GetMapping("/stores/business-hours")
	public ResponseEntity<Page<BusinessHourFindDto.Response>> findPage(
		@ModelAttribute BusinessHourFindDto.Request businessHourFindRequest, @PageableDefault Pageable pageable) {
		Page<BusinessHourFindDto.Response> businessHourFindResponsePage = businessHourQueryService.findPage(
			businessHourFindRequest, pageable);
		return ResponseEntity.status(HttpStatus.OK).body(businessHourFindResponsePage);
	}
}

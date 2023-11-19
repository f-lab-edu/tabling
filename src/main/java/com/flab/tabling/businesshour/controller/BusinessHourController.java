package com.flab.tabling.businesshour.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.flab.tabling.businesshour.dto.BusinessHourAddDto;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.service.BusinessHourQueryService;
import com.flab.tabling.businesshour.service.BusinessHourService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BusinessHourController {

	public final BusinessHourService businessHourService;
	public final BusinessHourQueryService businessHourQueryService;

	@PostMapping("/business-hours")
	public ResponseEntity<BusinessHourAddDto.Response> add(
		@RequestBody BusinessHourAddDto.Request businessHourAddRequest,
		@SessionAttribute(name = "MEMBER_ID") Long memberId) { // TODO: 2023-11-19 SessionAttribute Enum type 미지원, 타입 변경 고려
		BusinessHourAddDto.Response businessHourAddResponse = businessHourService.add(businessHourAddRequest, memberId);
		return ResponseEntity.status(HttpStatus.CREATED).body(businessHourAddResponse);
	}

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

	@PutMapping("/business-hours")
	public ResponseEntity<BusinessHourUpdateDto.Response> update(
		@RequestBody BusinessHourUpdateDto.Request businessHourUpdateRequest,
		@SessionAttribute(name = "MEMBER_ID") Long memberId) { // TODO: 2023-11-19 SessionAttribute Enum type 미지원, 타입 변경 고려
		BusinessHourUpdateDto.Response businessHourUpdateResponse = businessHourService.update(
			businessHourUpdateRequest, memberId);
		return ResponseEntity.status(HttpStatus.OK).body(businessHourUpdateResponse);
	}

	@DeleteMapping("/business-hours/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id, @SessionAttribute(name = "MEMBER_ID") Long memberId) {
		businessHourService.delete(id, memberId); // TODO: 2023-11-19 SessionAttribute Enum type 미지원, 타입 변경 고려
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}
}

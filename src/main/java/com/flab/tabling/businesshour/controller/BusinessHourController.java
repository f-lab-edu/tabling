package com.flab.tabling.businesshour.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.flab.tabling.businesshour.dto.BusinessHourAddDto;
import com.flab.tabling.businesshour.dto.BusinessHourFindDto;
import com.flab.tabling.businesshour.dto.BusinessHourUpdateDto;
import com.flab.tabling.businesshour.facade.BusinessHourFacade;
import com.flab.tabling.global.auth.Login;
import com.flab.tabling.member.dto.MemberSession;

import io.micrometer.core.annotation.Timed;
import lombok.RequiredArgsConstructor;

@Timed("api.timer")
@RestController
@RequiredArgsConstructor
public class BusinessHourController {

	public final BusinessHourFacade businessHourFacade;

	@PostMapping("/stores/{storeId}/business-hours")
	public ResponseEntity<BusinessHourAddDto.Response> add(
		@Login MemberSession memberSession, @RequestBody BusinessHourAddDto.Request businessHourAddRequest) {
		BusinessHourAddDto.Response businessHourAddResponse = businessHourFacade.add(memberSession.getId(),
			businessHourAddRequest);
		return ResponseEntity.status(HttpStatus.CREATED).body(businessHourAddResponse);
	}

	@GetMapping("/stores/{storeId}/business-hours")
	public ResponseEntity<List<BusinessHourFindDto.Response>> find(@PathVariable Long storeId) {
		List<BusinessHourFindDto.Response> businessHourFindResponses = businessHourFacade.find(storeId);
		return ResponseEntity.status(HttpStatus.OK).body(businessHourFindResponses);
	}

	@PutMapping("/stores/{storeId}/business-hours/{id}")
	public ResponseEntity<BusinessHourUpdateDto.Response> update(
		@PathVariable(value = "id") Long id, @Login MemberSession memberSession,
		@RequestBody BusinessHourUpdateDto.Request businessHourUpdateRequest) {
		BusinessHourUpdateDto.Response businessHourUpdateResponse = businessHourFacade.update(id, memberSession.getId(),
			businessHourUpdateRequest);
		return ResponseEntity.status(HttpStatus.OK).body(businessHourUpdateResponse);
	}

	@DeleteMapping("/stores/{storeId}/business-hours/{id}")
	public ResponseEntity<Void> delete(@PathVariable(value = "id") Long id, @Login MemberSession memberSession) {
		businessHourFacade.delete(id, memberSession.getId());
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}
}

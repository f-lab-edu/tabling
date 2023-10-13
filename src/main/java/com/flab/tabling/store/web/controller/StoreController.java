package com.flab.tabling.store.web.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.service.StoreRemoveService;
import com.flab.tabling.store.service.StoreUpdateService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class StoreController {
	private final StoreUpdateService storeUpdateService;
	private final StoreRemoveService storeRemoveService;

	@PutMapping("/stores/{id}")
	public ResponseEntity<StoreUpdateDto.Response> update(
		@Valid @RequestBody StoreUpdateDto.Request storeUpdateRequest,
		@SessionAttribute(name = "LOGIN_SESSION") Long sessionMemberId) { // TODO: 2023-10-13 세션 이름 변경 필요
		StoreUpdateDto.Response storeUpdateResponse = storeUpdateService.update(storeUpdateRequest, sessionMemberId);
		return ResponseEntity.status(HttpStatus.OK)
			.body(storeUpdateResponse);
	}

	@DeleteMapping("/stores/{id}")
	public ResponseEntity<Void> delete(@PathVariable(name = "id") Long storeId,
		@SessionAttribute(name = "LOGIN_SESSION") Long sessionMemberId) { // TODO: 2023-10-13 세션 이름 변경 필요
		storeRemoveService.delete(storeId, sessionMemberId);
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}
}

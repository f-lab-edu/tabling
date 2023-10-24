package com.flab.tabling.store.web.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.service.StoreService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class StoreController {
	private final StoreService storeService;

	@PostMapping("/stores")
	public ResponseEntity<StoreAddDto.Response> add(@Valid @RequestBody StoreAddDto.Request request,
		@SessionAttribute(name = "LOGIN_SESSION") Long memberId) { // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체
		StoreAddDto.Response storeResponseDto = storeService.add(request, memberId);
		return ResponseEntity.status(HttpStatus.CREATED)
			.body(storeResponseDto);
	}

	@PutMapping("/stores/{id}")
	public ResponseEntity<StoreUpdateDto.Response> update(
		@Valid @RequestBody StoreUpdateDto.Request storeUpdateRequest,
		@SessionAttribute(name = "LOGIN_SESSION") Long sessionMemberId) { // TODO: 2023-10-13 세션 이름 변경 필요
		StoreUpdateDto.Response storeUpdateResponse = storeService.update(storeUpdateRequest, sessionMemberId);
		return ResponseEntity.status(HttpStatus.OK)
			.body(storeUpdateResponse);
	}

	@DeleteMapping("/stores/{id}")
	public ResponseEntity<Void> delete(@PathVariable(name = "id") Long storeId,
		@SessionAttribute(name = "LOGIN_SESSION") Long sessionMemberId) { // TODO: 2023-10-13 세션 이름 변경 필요
		storeService.delete(storeId, sessionMemberId);
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}
}

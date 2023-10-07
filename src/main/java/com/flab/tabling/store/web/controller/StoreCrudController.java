package com.flab.tabling.store.web.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.service.StoreCrudService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping
@RequiredArgsConstructor
public class StoreCrudController {
	private final StoreCrudService storeCrudService;

	@PostMapping("/stores")
	public ResponseEntity<StoreAddDto.Response> add(@Valid @RequestBody StoreAddDto.Request request,
		@SessionAttribute(name = "LOGIN_SESSION") Long memberId) { // TODO: 2023-10-07 로그인 기능 추가 후 세션 이름 교체
		StoreAddDto.Response storeResponseDto = storeCrudService.add(request, memberId);
		return ResponseEntity.status(HttpStatus.CREATED)
			.body(storeResponseDto);
	}
}

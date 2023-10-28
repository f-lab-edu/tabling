package com.flab.tabling.store.web.controller;

import static org.springframework.data.domain.Sort.Direction.*;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
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

	@GetMapping("/stores/{id}")
	public ResponseEntity<StoreFindDto.Response> find(@PathVariable(name = "id") Long storeId) {
		StoreFindDto.Response storeFindResponse = storeService.find(storeId);
		return ResponseEntity.status(HttpStatus.OK)
			.body(storeFindResponse);
	}

	@GetMapping("/stores")
	public ResponseEntity<Page<StoreFindDto.Response>> findPage(
		@PageableDefault(sort = "id", direction = DESC) Pageable pageable) {
		Page<StoreFindDto.Response> storeFindResponsePages = storeService.findPage(pageable);
		return ResponseEntity.status(HttpStatus.OK)
			.body(storeFindResponsePages);
	}
}

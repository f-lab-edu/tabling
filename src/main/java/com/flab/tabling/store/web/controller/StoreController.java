package com.flab.tabling.store.web.controller;

import static org.springframework.data.domain.Sort.Direction.*;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.service.StoreService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping
@RequiredArgsConstructor
public class StoreController {
	private final StoreService storeService;

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

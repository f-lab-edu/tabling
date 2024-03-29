package com.flab.tabling.store.web.controller;

import static org.springframework.data.domain.Sort.Direction.*;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.flab.tabling.global.auth.Login;
import com.flab.tabling.member.dto.MemberSession;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.facade.StoreFacade;

import io.micrometer.core.annotation.Timed;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Timed("api.timer")
@RestController
@RequiredArgsConstructor
public class StoreController {

	private final StoreFacade storeFacade;

	@PostMapping("/stores")
	public ResponseEntity<StoreAddDto.Response> add(
		@Valid @RequestBody StoreAddDto.Request request, @Login MemberSession memberSession) {
		StoreAddDto.Response storeResponseDto = storeFacade.add(request, memberSession.getId());
		return ResponseEntity.status(HttpStatus.CREATED).body(storeResponseDto);
	}

	@GetMapping("/stores/{id}")
	public ResponseEntity<StoreFindDto.Response> find(@PathVariable(name = "id") Long storeId) {
		StoreFindDto.Response storeFindResponse = storeFacade.find(storeId);
		return ResponseEntity.status(HttpStatus.OK).body(storeFindResponse);
	}

	// TODO: 2024-01-07 성능 측정 후, 페이징 기능으로 변경
	@GetMapping(value = "/stores", params = "name")
	public ResponseEntity<StoreFindDto.Responses> find(@Param("name") String name) {
		StoreFindDto.Responses storeFindResponses = storeFacade.find(name);
		return ResponseEntity.status(HttpStatus.OK).body(storeFindResponses);
	}

	// TODO: 2024-01-07 페이징 기능과 비교후 제거
	@GetMapping("/stores/all")
	public ResponseEntity<StoreFindDto.Responses> findAll() {
		StoreFindDto.Responses storesFindResponse = storeFacade.findAll();
		return ResponseEntity.status(HttpStatus.OK).body(storesFindResponse);
	}

	@GetMapping("/stores")
	public ResponseEntity<Page<StoreFindDto.Response>> findPage(
		@PageableDefault(sort = "id", direction = DESC) Pageable pageable) {
		Page<StoreFindDto.Response> storeFindResponsePages = storeFacade.findPage(pageable);
		return ResponseEntity.status(HttpStatus.OK).body(storeFindResponsePages);
	}

	@PutMapping("/stores/{id}")
	public ResponseEntity<StoreUpdateDto.Response> update(
		@Valid @RequestBody StoreUpdateDto.Request storeUpdateRequest, @Login MemberSession memberSession) {
		StoreUpdateDto.Response storeUpdateResponse = storeFacade.update(storeUpdateRequest, memberSession.getId());
		return ResponseEntity.status(HttpStatus.OK).body(storeUpdateResponse);
	}

	@DeleteMapping("/stores/{id}")
	public ResponseEntity<Void> delete(@PathVariable(name = "id") Long storeId, @Login MemberSession memberSession) {
		storeFacade.delete(storeId, memberSession.getId());
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}
}

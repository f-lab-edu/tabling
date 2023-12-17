package com.flab.tabling.waiting.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.flab.tabling.global.auth.Login;
import com.flab.tabling.member.dto.MemberSession;
import com.flab.tabling.waiting.dto.WaitingAddDto;
import com.flab.tabling.waiting.facade.WaitingFacade;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WaitingController {
	private final WaitingFacade waitingFacade;

	@PostMapping("/stores/{storeId}/waiting")
	public ResponseEntity<WaitingAddDto.Response> addMyself(@Login MemberSession memberSession,
		@PathVariable Long storeId, @Valid @RequestBody WaitingAddDto.Request waitingRequestDto) {
		WaitingAddDto.Response waitingResponseDto = waitingFacade.add(storeId, memberSession.getId(),
			waitingRequestDto.getHeadCount());
		return ResponseEntity.status(HttpStatus.CREATED)
			.body(waitingResponseDto);
	}

	@DeleteMapping("/stores/{storeId}/waiting/{waitingId}")
	public ResponseEntity<Void> cancelByMember(@Login MemberSession memberSession,
		@PathVariable Long storeId, @PathVariable Long waitingId) {
		waitingFacade.cancelByMember(storeId, memberSession.getId(), waitingId);
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}

	@PatchMapping("/stores/{storeId}/waiting")
	public ResponseEntity<Void> acceptFirstByStore(@Login MemberSession memberSession,
		@PathVariable Long storeId) {
		waitingFacade.acceptFirst(memberSession.getId(), storeId);
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}

	@DeleteMapping("/stores/{storeId}/waiting")
	public ResponseEntity<Void> cancelFirstByStore(@Login MemberSession memberSession,
		@PathVariable Long storeId) {
		waitingFacade.cancelFirst(memberSession.getId(), storeId);
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}
}

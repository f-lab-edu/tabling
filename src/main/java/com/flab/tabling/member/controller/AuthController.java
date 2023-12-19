package com.flab.tabling.member.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.member.dto.MemberAuthDto;
import com.flab.tabling.member.facade.AuthFacade;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AuthController {
	private final AuthFacade authFacade;

	@PostMapping("/login")
	public ResponseEntity<MemberAuthDto.Response> login(HttpSession session,
		@Valid @RequestBody MemberAuthDto.Request memberRequestDto) {

		MemberAuthDto.Response memberResponseDto = authFacade.login(memberRequestDto, session);
		return ResponseEntity
			.status(HttpStatus.OK)
			.body(memberResponseDto);
	}

	@DeleteMapping("/logout")
	public ResponseEntity<MemberAuthDto.Response> logout(HttpSession session) {
		Long memberId = (Long)session.getAttribute(SessionConstant.MEMBER_ID.name());
		session.invalidate();
		return ResponseEntity
			.status(HttpStatus.OK)
			.body(new MemberAuthDto.Response(memberId));
	}
}

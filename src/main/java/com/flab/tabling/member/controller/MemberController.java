package com.flab.tabling.member.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.dto.MemberAuthDto;
import com.flab.tabling.member.service.MemberRegisterService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

/**
 * @RestController : @Controller + @ResponseBody
 * @Controller : @Component + 컨트롤러 계층임을 나타냄
 * @Component : 컴포넌트 스캔에서 스프링 빈으로 등록
 * @RequiredArgsConstructor : final 필드, @NonNull 필드에 대한 생성자 추가
 * @PostMapping : @RequestMapping(method = RequestMethod.POST
 */
@RestController
@RequiredArgsConstructor
public class MemberController {
	private final MemberRegisterService memberRegisterService;

	@PostMapping("/members")
	private ResponseEntity<MemberAddDto.Response> add(HttpServletRequest request,
		@Valid @RequestBody MemberAddDto.Request memberRequestDto) {
		addSession(request, memberRequestDto.getName());
		MemberAddDto.Response memberResponseDto = memberRegisterService.add(memberRequestDto);
		HttpSession session = request.getSession(false);
		session.invalidate();
		return ResponseEntity
			.status(HttpStatus.CREATED)
			.body(memberResponseDto);
	}

	@PostMapping("/login")
	public MemberAuthDto.Response login(HttpServletRequest request,
		@RequestBody MemberAuthDto.Request memberRequestDto) {
		MemberAuthDto.Response memberResponseDto = memberRegisterService.findByEmail(memberRequestDto);
		addSession(request, memberResponseDto.getId());
		return memberResponseDto;
	}

	@DeleteMapping("/logout")
	public MemberAuthDto.Response logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Long memberId = (Long)session.getAttribute(SessionConstant.MEMBER_ID.getKey());
		session.invalidate();
		return new MemberAuthDto.Response(memberId);
	}

	private void addSession(HttpServletRequest request, Long memberId) {
		HttpSession session = request.getSession();
		session.setAttribute(SessionConstant.MEMBER_ID.getKey(), memberId);
	}

	private void addSession(HttpServletRequest request, String name) {
		HttpSession session = request.getSession();
		session.setAttribute(SessionConstant.MEMBER_NAME.getKey(), name);
	}
}

package com.flab.tabling.member.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.service.MemberRegisterService;

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
	private ResponseEntity<MemberAddDto.Response> add(@Valid @RequestBody MemberAddDto.Request memberRequestDto) {
		MemberAddDto.Response memberResponseDto = memberRegisterService.add(memberRequestDto);
		return ResponseEntity
			.status(HttpStatus.CREATED)
			.body(memberResponseDto);
	}
}

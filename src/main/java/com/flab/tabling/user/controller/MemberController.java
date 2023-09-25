package com.flab.tabling.user.controller;

import com.flab.tabling.user.dto.MemberAddDto;
import com.flab.tabling.user.service.MemberRegisterService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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
	private ResponseEntity add(@Valid @RequestBody MemberAddDto.Request memberDto) {
		memberRegisterService.add(memberDto);
		return ResponseEntity.status(HttpStatus.CREATED).build();
	}
}

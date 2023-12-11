package com.flab.tabling.member.facade;

import org.springframework.stereotype.Component;

import com.flab.tabling.global.service.CipherService;
import com.flab.tabling.member.service.MemberQueryService;
import com.flab.tabling.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MemberFacade {
	private final MemberService memberService;
	private final CipherService twoWayCipherService;
	private final MemberQueryService memberQueryService;

}

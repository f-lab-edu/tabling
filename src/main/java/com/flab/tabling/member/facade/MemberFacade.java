package com.flab.tabling.member.facade;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.service.OneWayCipherService;
import com.flab.tabling.global.service.TwoWayCipherService;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.service.MemberQueryService;
import com.flab.tabling.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MemberFacade {
	private final OneWayCipherService oneWayCipherService;
	private final TwoWayCipherService twoWayCipherService;
	private final MemberService memberService;
	private final MemberQueryService memberQueryService;

	@Transactional
	public MemberAddDto.Response add(MemberAddDto.Request memberRequestDto) {
		String encryptedPassword = oneWayCipherService.encrypt(memberRequestDto.getPassword());
		String encryptedEmail = twoWayCipherService.encrypt(memberRequestDto.getEmail());
		memberQueryService.checkEmailDuplicated(encryptedEmail);
		Member member = memberService.add(memberRequestDto.getName(), encryptedEmail, encryptedPassword,
			memberRequestDto.getRoleType());
		return new MemberAddDto.Response(member.getId());
	}
}

package com.flab.tabling.member.facade;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.global.service.CipherService;
import com.flab.tabling.global.service.SessionService;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.service.MemberQueryService;
import com.flab.tabling.member.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MemberFacade {
	private final CipherService oneWayCipherService;
	private final CipherService twoWayCipherService;
	private final MemberService memberService;
	private final MemberQueryService memberQueryService;
	private final SessionService sessionService;

	@Transactional
	public MemberAddDto.Response add(MemberAddDto.Request memberRequestDto, HttpSession session) {
		String encryptedPassword = oneWayCipherService.encrypt(memberRequestDto.getPassword());
		String encryptedEmail = twoWayCipherService.encrypt(memberRequestDto.getEmail());
		memberQueryService.checkEmailDuplicated(encryptedEmail);
		sessionService.add(session, SessionConstant.MEMBER_NAME, memberRequestDto.getName());
		Member member = memberService.add(memberRequestDto.getName(), encryptedEmail, encryptedPassword,
			memberRequestDto.getRoleType());
		sessionService.invalidate(session);
		return new MemberAddDto.Response(member.getId());
	}
}

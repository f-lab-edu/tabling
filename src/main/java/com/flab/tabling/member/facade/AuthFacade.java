package com.flab.tabling.member.facade;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.global.service.OneWayCipherService;
import com.flab.tabling.global.service.SessionService;
import com.flab.tabling.global.service.TwoWayCipherService;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.dto.MemberAuthDto;
import com.flab.tabling.member.exception.InvalidPasswordException;
import com.flab.tabling.member.service.MemberQueryService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class AuthFacade {
	private final TwoWayCipherService twoWayCipherService;
	private final OneWayCipherService oneWayCipherService;
	private final SessionService sessionService;
	private final MemberQueryService memberQueryService;

	@Transactional(readOnly = true)
	public MemberAuthDto.Response login(MemberAuthDto.Request memberRequestDto, HttpSession session) {
		String encryptedEmail = twoWayCipherService.encrypt(memberRequestDto.getEmail());
		Member member = memberQueryService.findByEncryptedEmail(encryptedEmail);
		boolean isValid = oneWayCipherService.match(memberRequestDto.getPassword(), member.getPassword());
		if (!isValid) {
			throw new InvalidPasswordException(ErrorCode.AUTHENTICATION_FAILED, "password is invalid");
		}
		sessionService.add(session, SessionConstant.MEMBER_NAME, member.getName());
		sessionService.add(session, SessionConstant.MEMBER_ID, member.getId());
		return new MemberAuthDto.Response(member.getId());
	}
}

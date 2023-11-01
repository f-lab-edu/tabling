package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.service.CipherService;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.global.service.SessionService;
import com.flab.tabling.global.util.SessionConstant;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.dto.MemberAuthDto;
import com.flab.tabling.member.exception.InvalidPasswordException;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthService {
	private final CipherService oneWayCipherService;
	private final SessionService sessionService;
	private final MemberQueryService memberQueryService;

	@Transactional(readOnly = true)
	public MemberAuthDto.Response login(MemberAuthDto.Request memberRequestDto, HttpSession session) {
		Member member = memberQueryService.findByEmail(memberRequestDto.getEmail());
		boolean isValid = oneWayCipherService.match(memberRequestDto.getPassword(), member.getPassword());
		if (!isValid) {
			throw new InvalidPasswordException(ErrorCode.AUTHENTICATION_FAILED, "password is invalid");
		}
		sessionService.add(session, SessionConstant.MEMBER_NAME, member.getName());
		sessionService.add(session, SessionConstant.MEMBER_ID, member.getId());
		return new MemberAuthDto.Response(member.getId());
	}
}

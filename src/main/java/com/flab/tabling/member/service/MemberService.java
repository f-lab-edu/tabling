package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.config.CipherService;
import com.flab.tabling.global.service.SessionService;
import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.exception.MemberDuplicatedException;
import com.flab.tabling.member.repository.MemberRepository;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

/**
 * @Service : @Component + service 계층임을 나타냄
 */
@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberRepository memberRepository;
	private final SessionService sessionService;
	private final CipherService oneWayCipherService;
	private final CipherService twoWayCipherService;

	@Transactional
	public MemberAddDto.Response addMember(MemberAddDto.Request memberRequestDto, HttpSession session) {
		String encryptedPassword = oneWayCipherService.encrypt(memberRequestDto.getPassword());
		String encryptedEmail = twoWayCipherService.encrypt(memberRequestDto.getEmail());
		if (memberRepository.findByEmail(encryptedEmail).isPresent()) {
			throw new MemberDuplicatedException();
		}
		sessionService.add(session, SessionConstant.MEMBER_NAME, memberRequestDto.getName());
		Member member = Member.builder()
			.name(memberRequestDto.getName())
			.email(encryptedEmail)
			.password(encryptedPassword)
			.roleType(memberRequestDto.getRoleType())
			.build();
		memberRepository.save(member);
		sessionService.invalidate(session);
		return new MemberAddDto.Response(member.getId());
	}
}

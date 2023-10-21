package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.config.CipherService;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.dto.MemberAuthDto;
import com.flab.tabling.member.exception.AuthenticationException;
import com.flab.tabling.member.exception.MemberDuplicatedException;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

/**
 * @Service : @Component + service 계층임을 나타냄
 */
@Service
@RequiredArgsConstructor
public class MemberRegisterService {
	private final MemberRepository memberRepository;
	private final CipherService oneWayCipherService;
	private final CipherService twoWayCipherService;

	@Transactional
	public MemberAddDto.Response add(MemberAddDto.Request memberRequestDto) {
		String encryptedPassword = oneWayCipherService.encrypt(memberRequestDto.getPassword());
		String encryptedEmail = twoWayCipherService.encrypt(memberRequestDto.getEmail());
		if (memberRepository.findByEmail(encryptedEmail).isPresent()) {
			throw new MemberDuplicatedException();
		}
		Member member = Member.builder()
			.name(memberRequestDto.getName())
			.email(encryptedEmail)
			.password(encryptedPassword)
			.roleType(memberRequestDto.getRoleType())
			.build();
		memberRepository.save(member);
		return new MemberAddDto.Response(member.getId());
	}

	@Transactional(readOnly = true)
	public MemberAuthDto.Response findByEmail(MemberAuthDto.Request memberRequestDto) {
		String encryptedEmail = twoWayCipherService.encrypt(memberRequestDto.getEmail());
		Member member = memberRepository.findByEmail(encryptedEmail).orElseThrow(MemberNotFoundException::new);
		boolean isValid = oneWayCipherService.match(memberRequestDto.getPassword(), member.getPassword());
		if (!isValid) {
			throw new AuthenticationException();
		}
		return new MemberAuthDto.Response(member.getId());
	}

}

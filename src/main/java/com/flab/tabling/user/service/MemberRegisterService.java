package com.flab.tabling.user.service;

import com.flab.tabling.user.domain.Member;
import com.flab.tabling.user.dto.MemberDto;
import com.flab.tabling.user.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * @Service : @Component + service 계층임을 나타냄
 */
@Service
@RequiredArgsConstructor
public class MemberRegisterService {
	private final PasswordEncoder passwordEncoder;
	private final MemberRepository memberRepository;

	public void add(MemberDto memberDto) {
		String encodedMail = passwordEncoder.encode(memberDto.getEmail());
		String encodedPassword = passwordEncoder.encode(memberDto.getPassword());
		Member member = Member.builder()
			.name(memberDto.getName())
			.email(encodedMail)
			.password(encodedPassword)
			.roleType(memberDto.getRoleType())
			.build();
		memberRepository.save(member);
	}

}

package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberRepository memberRepository;

	public Member add(String name, String encryptedEmail, String encryptedPassword, RoleType roleType) {
		Member member = Member.builder()
			.name(name)
			.email(encryptedEmail)
			.password(encryptedPassword)
			.roleType(roleType)
			.build();
		memberRepository.save(member);
		return member;
	}
}

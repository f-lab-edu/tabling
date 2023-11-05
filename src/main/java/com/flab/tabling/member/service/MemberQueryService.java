package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.config.CipherService;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberQueryService {
	private final CipherService twoWayCipherService;
	private final MemberRepository memberRepository;

	@Transactional(readOnly = true)
	public Member findByEmail(String email) {
		String encryptedEmail = twoWayCipherService.encrypt(email);
		return memberRepository.findByEmail(encryptedEmail)
			.orElseThrow(() -> new MemberNotFoundException(ErrorCode.MEMBER_NOT_FOUND, "member with this email is not found"));
	}
}

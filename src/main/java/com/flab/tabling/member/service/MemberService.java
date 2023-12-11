package com.flab.tabling.member.service;

import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.exception.MemberDuplicatedException;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberRepository memberRepository;

	@Transactional(readOnly = true)
	public Member findByEncryptedEmail(String encryptedEmail) {
		return memberRepository.findByEmail(encryptedEmail)
			.orElseThrow(
				() -> new MemberNotFoundException(ErrorCode.MEMBER_NOT_FOUND, "member with this email is not found"));
	}

	@Transactional(readOnly = true)
	public void checkEmailDuplicated(String encryptedEmail) {
		Optional<Member> memberOptional = memberRepository.findByEmail(encryptedEmail);
		if (memberOptional.isPresent()) {
			throw new MemberDuplicatedException(ErrorCode.MEMBER_DUPLICATED, "member with this email already exists");
		}
	}

	@Transactional
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

	@Transactional(readOnly = true)
	public boolean isSeller(Long memberId) {
		Member targetMember = getMember(memberId);
		return targetMember.isSeller(); // TODO: 2023-10-09 Member 엔티티 내부에서 처리
	}

	public Member getMember(Long memberId) {
		return memberRepository.findById(memberId)
			.orElseThrow(
				() -> new MemberNotFoundException(ErrorCode.MEMBER_NOT_FOUND, "member is not found by given id"));
	}
}

package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberRepository memberRepository;

	@Transactional(readOnly = true)
	public boolean isSeller(Long memberId) {
		Member targetMember = getMember(memberId);
		return targetMember.getRoleType().equals(RoleType.SELLER); // TODO: 2023-10-09 Member 엔티티 내부에서 처리
	}

	private Member getMember(Long memberId) {
		return memberRepository.findById(memberId)
			.orElseThrow(RuntimeException::new); // TODO: 2023-10-04 커스텀 예외로 변경 필요
	}
}

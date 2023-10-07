package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RoleTypeCheckService {
	private final MemberRepository memberRepository;

	@Transactional(readOnly = true)
	public boolean isSeller(Long memberId) {
		Member targetMember = memberRepository.findById(memberId)
			.orElseThrow(RuntimeException::new); // TODO: 2023-10-04 커스텀 예외로 변경 필요
		return targetMember.getRoleType().equals(RoleType.SELLER);
	}
}

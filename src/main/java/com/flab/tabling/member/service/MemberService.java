package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.config.CipherService;
import com.flab.tabling.global.service.SessionService;
import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.exception.MemberDuplicatedException;
import com.flab.tabling.member.repository.MemberRepository;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberRepository memberRepository;
	private final SessionService sessionService;
	private final CipherService oneWayCipherService;
	private final CipherService twoWayCipherService;

	@Transactional
	public MemberAddDto.Response add(MemberAddDto.Request memberRequestDto, HttpSession session) {
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

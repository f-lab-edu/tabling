package com.flab.tabling.member.service;

import org.springframework.stereotype.Service;

import com.flab.tabling.global.config.CipherService;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

/**
 * @Service : @Component + service 계층임을 나타냄
 */
@Service
@RequiredArgsConstructor
public class MemberRegisterService {
	private final MemberRepository memberRepository;
	private final CipherService cipherService;

	public MemberAddDto.Response add(MemberAddDto.Request memberRequestDto) {
		String encryptedPassword = cipherService.encryptPassword(memberRequestDto.getPassword());
		String encryptedEmail = cipherService.encryptEmail(memberRequestDto.getEmail());
		Member member = Member.builder()
			.name(memberRequestDto.getName())
			.email(encryptedEmail)
			.password(encryptedPassword)
			.roleType(memberRequestDto.getRoleType())
			.build();
		memberRepository.save(member);
		return MemberAddDto.Response.builder()
			.id(member.getId())
			.name(member.getName())
			.email(cipherService.decryptEmail(member.getEmail()))
			.roleType(member.getRoleType())
			.build();
	}

}

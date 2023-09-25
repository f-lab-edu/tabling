package com.flab.tabling.user.service;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import com.flab.tabling.global.config.EncryptService;
import com.flab.tabling.user.domain.Member;
import com.flab.tabling.user.dto.MemberAddDto;
import com.flab.tabling.user.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

import org.springframework.security.crypto.encrypt.BytesEncryptor;
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
	private final EncryptService encryptService;

	public void add(MemberAddDto.Request memberDto) {
		String encodedPassword = passwordEncoder.encode(memberDto.getPassword());
		String encryptedEmail = encryptService.encrypt(memberDto.getEmail());
		Member member = Member.builder()
			.name(memberDto.getName())
			.email(encryptedEmail)
			.password(encodedPassword)
			.roleType(memberDto.getRoleType())
			.build();
		memberRepository.save(member);
	}

}

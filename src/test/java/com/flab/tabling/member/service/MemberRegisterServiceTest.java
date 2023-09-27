package com.flab.tabling.member.service;

import static org.mockito.BDDMockito.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.global.config.CipherService;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.repository.MemberRepository;

@ExtendWith(MockitoExtension.class)
class MemberRegisterServiceTest {
	@InjectMocks
	MemberRegisterService memberRegisterService;

	@Mock
	CipherService cipherService;

	@Mock
	MemberRepository memberRepository;

	@Test
	@DisplayName("회원가입")
	void addMember() {
		//given
		Member member = Member.builder()
			.name("euijin")
			.roleType(RoleType.CUSTOMER)
			.email("euijin@test.com")
			.password("123456789")
			.build();
		MemberAddDto.Request memberRequestDto = MemberAddDto.Request
			.builder()
			.name("euijin")
			.roleType(RoleType.CUSTOMER)
			.email("euijin@test.com")
			.password("123456789")
			.build();
		given(cipherService.decryptEmail(any())).willReturn("euijin@test.com");
		given(cipherService.encryptEmail(any())).willReturn("euijin@test.com");
		given(cipherService.encryptPassword(any())).willReturn("123456789");
		//when
		memberRegisterService.add(memberRequestDto);
		//then
		verify(memberRepository).save(any());

	}

}

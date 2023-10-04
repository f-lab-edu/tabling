package com.flab.tabling.member.service;

import static org.mockito.BDDMockito.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.global.config.CipherService;
import com.flab.tabling.global.config.StringGenerateFixture;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.repository.MemberRepository;

/**
 * @InjectMocks : @Mock이 붙은 Mock 객체를 @InjectMocks이 붙은 객체에 주입
 * @Mock : Mock 객체 생성
 */
@ExtendWith(MockitoExtension.class)
class MemberRegisterServiceTest {
	@InjectMocks
	MemberRegisterService memberRegisterService;

	@Mock
	CipherService oneWayCipherService;

	@Mock
	CipherService twoWayCipherService;

	@Mock
	MemberRepository memberRepository;

	@Test
	@DisplayName("회원가입")
	void addMember() {
		//given
		MemberAddDto.Request memberRequestDto = MemberAddDto.Request.builder()
			.name(StringGenerateFixture.makeByNumbersAndAlphabets(6))
			.roleType(RoleType.CUSTOMER)
			.email(StringGenerateFixture.makeEmail(8))
			.password(StringGenerateFixture.makeByNumbersAndAlphabets(9))
			.build();
		//when
		memberRegisterService.add(memberRequestDto);
		//then
		verify(memberRepository).save(any());

	}

}

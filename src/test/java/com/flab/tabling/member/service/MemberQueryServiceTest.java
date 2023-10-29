package com.flab.tabling.member.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Optional;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.global.config.CipherService;
import com.flab.tabling.global.config.StringGenerateFixture;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.repository.MemberRepository;

@ExtendWith(MockitoExtension.class)
class MemberQueryServiceTest {
	@InjectMocks
	MemberQueryService memberQueryService;
	@Mock
	CipherService twoWayCipherService;
	@Mock
	MemberRepository memberRepository;

	@Test
	@DisplayName("findByEmail 성공 테스트")
	void findByEmailSuccess() {
		//given
		String email = StringGenerateFixture.makeEmail(10);
		String encryptEmail = StringGenerateFixture.makeByHexCharacter(20);
		Member member = Mockito.mock(Member.class);
		doReturn(encryptEmail).when(twoWayCipherService).encrypt(email);
		doReturn(Optional.of(member)).when(memberRepository).findByEmail(encryptEmail);

		//when
		Member result = memberQueryService.findByEmail(email);

		//then
		Assertions.assertThat(result).isSameAs(member);
	}

	@Test
	@DisplayName("findByEmail 실패 테스트 : MemberNotFound 예외 발생")
	void findByEmailFailure() {
		//given
		String email = StringGenerateFixture.makeEmail(10);
		String encryptEmail = StringGenerateFixture.makeByHexCharacter(20);
		Member member = Mockito.mock(Member.class);
		doReturn(encryptEmail).when(twoWayCipherService).encrypt(email);
		doThrow(MemberNotFoundException.class).when(memberRepository).findByEmail(encryptEmail);

		//when, then
		assertThrows(MemberNotFoundException.class, () -> memberQueryService.findByEmail(email));
	}
}

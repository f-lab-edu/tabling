package com.flab.tabling.member.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockHttpSession;

import com.flab.tabling.global.service.CipherService;
import com.flab.tabling.global.service.StringGenerateFixture;
import com.flab.tabling.global.service.SessionService;
import com.flab.tabling.global.util.SessionConstant;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.dto.MemberAuthDto;
import com.flab.tabling.member.exception.InvalidPasswordException;

import jakarta.servlet.http.HttpSession;

@ExtendWith(MockitoExtension.class)
class AuthServiceTest {
	@InjectMocks
	AuthService authService;

	@Mock
	CipherService oneWayCipherService;

	@Mock
	SessionService sessionService;

	@Mock
	MemberQueryService memberQueryService;

	HttpSession session;

	@BeforeEach
	void init() {
		session = new MockHttpSession();
	}

	@Test
	@DisplayName("로그인 성공")
	void loginSuccess() {
		//given
		String email = StringGenerateFixture.makeEmail(10);
		String passWord = StringGenerateFixture.makeByNumbersAndLowerLetters(10);
		MemberAuthDto.Request memberRequestDto = MemberAuthDto.Request
			.builder()
			.email(email)
			.password(passWord)
			.build();
		String sampleEncryptedPassword = StringGenerateFixture.makeByNumbersAndLowerLetters(20);
		Member member = Mockito.mock(Member.class);
		doReturn(1L).when(member).getId();
		doReturn("name").when(member).getName();
		doReturn(sampleEncryptedPassword).when(member).getPassword();
		doReturn(member).when(memberQueryService).findByEmail(email);
		doReturn(true).when(oneWayCipherService).match(passWord, sampleEncryptedPassword);
		MemberAuthDto.Response memberResponseDto = new MemberAuthDto.Response(1L);
		HttpSession session = new MockHttpSession();

		//when
		MemberAuthDto.Response result = authService.login(memberRequestDto, session);

		//then
		verify(sessionService).add(any(), eq(SessionConstant.MEMBER_NAME), anyString());
		verify(sessionService).add(any(), eq(SessionConstant.MEMBER_ID), anyLong());
		Assertions.assertThat(result).usingRecursiveComparison().isEqualTo(memberResponseDto);
	}

	@Test
	@DisplayName("로그인 실패 : 비밀번호 불일치")
	void loginFailure() {
		//given
		String email = StringGenerateFixture.makeEmail(10);
		String passWord = StringGenerateFixture.makeByNumbersAndLowerLetters(10);
		MemberAuthDto.Request memberRequestDto = MemberAuthDto.Request
			.builder()
			.email(email)
			.password(passWord)
			.build();
		String sampleEncryptedPassword = StringGenerateFixture.makeByNumbersAndLowerLetters(20);
		Member member = Mockito.mock(Member.class);
		doReturn(sampleEncryptedPassword).when(member).getPassword();
		doReturn(member).when(memberQueryService).findByEmail(email);
		doReturn(false).when(oneWayCipherService).match(passWord, sampleEncryptedPassword);
		MemberAuthDto.Response memberResponseDto = new MemberAuthDto.Response(1L);

		//when, then
		assertThrows(InvalidPasswordException.class, () -> authService.login(memberRequestDto, session));
	}

}

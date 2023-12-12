package com.flab.tabling.member.facade;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockHttpSession;

import com.flab.tabling.global.constant.SessionConstant;
import com.flab.tabling.global.service.OneWayCipherService;
import com.flab.tabling.global.service.SessionService;
import com.flab.tabling.global.service.StringGenerateFixture;
import com.flab.tabling.global.service.TwoWayCipherService;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.exception.MemberDuplicatedException;
import com.flab.tabling.member.service.MemberQueryService;
import com.flab.tabling.member.service.MemberService;

@ExtendWith(MockitoExtension.class)
class MemberFacadeTest {
	@InjectMocks
	MemberFacade memberFacade;

	@Mock
	OneWayCipherService oneWayCipherService;
	@Mock
	TwoWayCipherService twoWayCipherService;

	@Mock
	SessionService sessionService;

	@Mock
	MemberService memberService;

	@Mock
	MemberQueryService memberQueryService;

	@Mock
	MockHttpSession session;

	@Test
	@DisplayName("회원가입 성공 : 이메일이 중복되지 않음")
	void addMemberSuccess() {

		//given
		MemberAddDto.Request memberRequestDto = MemberAddDto.Request.builder()
			.name(StringGenerateFixture.makeByNumbersAndAlphabets(6))
			.roleType(RoleType.CUSTOMER)
			.email(StringGenerateFixture.makeEmail(8))
			.password(StringGenerateFixture.makeByNumbersAndAlphabets(9))
			.build();
		String encryptedPassword = StringGenerateFixture.makeByNumbersAndLowerLetters(20);
		String encryptedEmail = StringGenerateFixture.makeByNumbersAndLowerLetters(20);

		doNothing().when(memberQueryService).checkEmailDuplicated(encryptedEmail);
		Member member = Mockito.mock(Member.class);
		session = new MockHttpSession();
		doReturn(encryptedPassword).when(oneWayCipherService).encrypt(memberRequestDto.getPassword());
		doReturn(encryptedEmail).when(twoWayCipherService).encrypt(memberRequestDto.getEmail());
		doReturn(member).when(memberService).add(memberRequestDto.getName(), encryptedEmail, encryptedPassword,
			memberRequestDto.getRoleType());
		doReturn(1L).when(member).getId();

		//when
		MemberAddDto.Response response = memberFacade.add(memberRequestDto, session);

		//then
		verify(sessionService).add(any(MockHttpSession.class), eq(SessionConstant.MEMBER_NAME),
			eq(memberRequestDto.getName()));
		verify(memberService).add(anyString(), anyString(), anyString(), any(RoleType.class));
		verify(sessionService).invalidate(any(MockHttpSession.class));
		Assertions.assertThat(response.getId()).isEqualTo(1L);
	}

	@Test
	@DisplayName("회원가입 실패 : 이메일 중복")
	void addMemberFailure() {
		//given
		MemberAddDto.Request memberRequestDto = MemberAddDto.Request.builder()
			.name(StringGenerateFixture.makeByNumbersAndAlphabets(6))
			.roleType(RoleType.CUSTOMER)
			.email(StringGenerateFixture.makeEmail(8))
			.password(StringGenerateFixture.makeByNumbersAndAlphabets(9))
			.build();
		String encryptedPassword = StringGenerateFixture.makeByNumbersAndLowerLetters(20);
		String encryptedEmail = StringGenerateFixture.makeByNumbersAndLowerLetters(20);
		doThrow(MemberDuplicatedException.class).when(memberQueryService).checkEmailDuplicated(encryptedEmail);
		doReturn(encryptedPassword).when(oneWayCipherService).encrypt(memberRequestDto.getPassword());
		doReturn(encryptedEmail).when(twoWayCipherService).encrypt(memberRequestDto.getEmail());

		//when, then
		assertThrows(MemberDuplicatedException.class,
			() -> memberFacade.add(memberRequestDto, session));
	}
}

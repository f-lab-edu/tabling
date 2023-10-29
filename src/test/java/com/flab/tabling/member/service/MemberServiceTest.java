package com.flab.tabling.member.service;

import static org.mockito.BDDMockito.*;

import java.util.Optional;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockHttpSession;

import com.flab.tabling.global.config.OneWayCipherService;
import com.flab.tabling.global.config.StringGenerateFixture;
import com.flab.tabling.global.config.TwoWayCipherService;
import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.exception.MemberDuplicatedException;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.service.SessionService;

/**
 * @InjectMocks : @Mock이 붙은 Mock 객체를 @InjectMocks이 붙은 객체에 주입
 * @Mock : Mock 객체 생성
 */
@ExtendWith(MockitoExtension.class)
class MemberRegisterServiceTest {
	@InjectMocks
	MemberRegisterService memberRegisterService;

	@Mock
	OneWayCipherService oneWayCipherService;
	@Mock
	TwoWayCipherService twoWayCipherService;

	@Mock
	SessionService sessionService;

	@Mock
	MemberRepository memberRepository;

	@Mock
	MockHttpSession session;

	@BeforeEach
	void init() {
		session = new MockHttpSession();
	}

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
		doReturn(Optional.empty()).when(memberRepository).findByEmail(any());
		session = new MockHttpSession();

		//when
		MemberAddDto.Response response = memberRegisterService.addMember(memberRequestDto, session);

		//then
		verify(sessionService).add(any(), eq(SessionConstant.MEMBER_NAME), eq(memberRequestDto.getName()));
		verify(memberRepository).save(any());
		verify(sessionService).invalidate(any());
	}

	@Test
	@DisplayName("회원가입 실패 : 이메일 중복")
	void addMemberFailure() {
		Member member = Mockito.mock(Member.class);
		//given
		MemberAddDto.Request memberRequestDto = MemberAddDto.Request.builder()
			.name(StringGenerateFixture.makeByNumbersAndAlphabets(6))
			.roleType(RoleType.CUSTOMER)
			.email(StringGenerateFixture.makeEmail(8))
			.password(StringGenerateFixture.makeByNumbersAndAlphabets(9))
			.build();
		doReturn(Optional.of(member)).when(memberRepository).findByEmail(any());
		session = new MockHttpSession();

		//when, then
		Assertions.assertThrows(MemberDuplicatedException.class,
			() -> memberRegisterService.addMember(memberRequestDto, session));
	}

}

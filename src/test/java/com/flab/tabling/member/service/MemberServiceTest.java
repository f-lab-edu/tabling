package com.flab.tabling.member.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.*;

import java.util.Optional;

import org.assertj.core.api.Assertions;
import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
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
import com.flab.tabling.global.service.SessionService;
import com.flab.tabling.global.session.SessionConstant;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.dto.MemberAddDto;
import com.flab.tabling.member.exception.MemberDuplicatedException;
import com.flab.tabling.member.repository.MemberRepository;

/**
 * @InjectMocks : @Mock이 붙은 Mock 객체를 @InjectMocks이 붙은 객체에 주입
 * @Mock : Mock 객체 생성
 */
@ExtendWith(MockitoExtension.class)
class MemberServiceTest {
	@InjectMocks
	MemberService memberService;

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
		MemberAddDto.Response response = memberService.add(memberRequestDto, session);

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
		assertThrows(MemberDuplicatedException.class,
			() -> memberService.add(memberRequestDto, session));
	}

	@Test
	@DisplayName("회원 RoleType 확인 결과, 가게주인이 맞다면 true를 반환한다.")
	void checkSellerSuccessReturnTrue() {
		//given
		Member seller = getSeller();

		doReturn(Optional.ofNullable(seller)).when(memberRepository)
			.findById(1L);

		//when
		boolean result = memberService.isSeller(1L);

		//then
		org.assertj.core.api.Assertions.assertThat(result).isTrue();
	}

	@Test
	@DisplayName("회원 RoleType 확인 결과, 가게주인이 아니라면 false를 반환한다.")
	void checkSellerFailReturnFalse() {
		//given
		Member customer = getCustomer();

		doReturn(Optional.ofNullable(customer)).when(memberRepository)
			.findById(1L);

		//when
		boolean result = memberService.isSeller(1L);

		//then
		Assertions.assertThat(result).isFalse();
	}

	private Member getCustomer() {
		EasyRandomParameters customerParam = new EasyRandomParameters();
		customerParam.randomize(RoleType.class, () -> RoleType.CUSTOMER);
		EasyRandom customerRandom = new EasyRandom(customerParam);
		return customerRandom.nextObject(Member.class);
	}

	private Member getSeller() {
		EasyRandomParameters sellerParam = new EasyRandomParameters();
		sellerParam.randomize(RoleType.class, () -> RoleType.SELLER);
		EasyRandom sellerRandom = new EasyRandom(sellerParam);
		return sellerRandom.nextObject(Member.class);
	}
}

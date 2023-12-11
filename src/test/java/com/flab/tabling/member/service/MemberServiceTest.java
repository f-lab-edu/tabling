package com.flab.tabling.member.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Optional;

import org.assertj.core.api.Assertions;
import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.global.service.StringGenerateFixture;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.exception.MemberDuplicatedException;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.repository.MemberRepository;

@ExtendWith(MockitoExtension.class)
class MemberServiceTest {
	@InjectMocks
	MemberService memberService;
	@Mock
	MemberRepository memberRepository;

	@Test
	@DisplayName("findByEncryptedEmail 성공 테스트")
	void findByEmailSuccess() {
		//given
		String encryptEmail = StringGenerateFixture.makeByHexCharacter(20);
		Member member = Mockito.mock(Member.class);
		doReturn(Optional.of(member)).when(memberRepository).findByEmail(encryptEmail);

		//when
		Member result = memberService.findByEncryptedEmail(encryptEmail);

		//then
		Assertions.assertThat(result).isSameAs(member);
	}

	@Test
	@DisplayName("findByEncryptedEmail 실패 테스트 : MemberNotFound 예외 발생")
	void findByEmailFailure() {
		//given
		String encryptEmail = StringGenerateFixture.makeByHexCharacter(20);
		Member member = Mockito.mock(Member.class);
		doThrow(MemberNotFoundException.class).when(memberRepository).findByEmail(encryptEmail);

		//when, then
		assertThrows(MemberNotFoundException.class, () -> memberService.findByEncryptedEmail(encryptEmail));
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

	@Test
	@DisplayName("checkEmailDuplicated 성공 테스트")
	public void checkEmailDuplicatedSuccess() {
		//given
		String encryptedEmail = StringGenerateFixture.makeEmail(10);
		doReturn(Optional.empty()).when(memberRepository).findByEmail(encryptedEmail);

		//when, then
		memberService.checkEmailDuplicated(encryptedEmail);
	}

	@Test
	@DisplayName("checkEmailDuplicated 실패 테스트")
	public void checkEmailDuplicatedFailure() {
		//given
		Member member = getCustomer();
		String encryptedEmail = StringGenerateFixture.makeEmail(10);
		doReturn(Optional.of(member)).when(memberRepository).findByEmail(encryptedEmail);

		//when, then
		assertThrows(MemberDuplicatedException.class, () -> memberService.checkEmailDuplicated(encryptedEmail));
	}

	@Test
	@DisplayName("add 성공 테스트")
	void addSuccess() {

		//given
		Member member = getCustomer();

		//when
		memberService.add(member.getName(), member.getEmail(), member.getPassword(), member.getRoleType());

		//then
		verify(memberRepository).save(any(Member.class));
	}

}

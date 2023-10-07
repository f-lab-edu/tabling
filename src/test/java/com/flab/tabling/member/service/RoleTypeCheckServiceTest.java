package com.flab.tabling.member.service;

import static org.mockito.Mockito.*;

import java.util.Optional;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.member.repository.MemberRepository;

@ExtendWith(MockitoExtension.class)
class RoleTypeCheckServiceTest {

	@InjectMocks
	private RoleTypeCheckService roleTypeCheckService;

	@Mock
	private MemberRepository memberRepository;

	@Test
	@DisplayName("회원 RoleType 확인 결과, 가게주인이 맞다면 true를 반환한다.")
	void checkSellerSuccessReturnTrue() {
		//given
		Member seller = getSeller();
		doReturn(Optional.ofNullable(seller)).when(memberRepository)
			.findById(1L);

		//when
		boolean result = roleTypeCheckService.isSeller(1L);

		//then
		Assertions.assertThat(result).isTrue();
	}

	@Test
	@DisplayName("회원 RoleType 확인 결과, 가게주인이 아니라면 false를 반환한다.")
	void checkSellerFailReturnFalse() {
		//given
		Member customer = getCustomer();
		doReturn(Optional.ofNullable(customer)).when(memberRepository)
			.findById(1L);

		//when
		boolean result = roleTypeCheckService.isSeller(1L);

		//then
		Assertions.assertThat(result).isFalse();
	}

	private Member getCustomer() {
		return Member.builder()
			.name("CUSTOMER_A")
			.email("customer@test.test")
			.password("password")
			.roleType(RoleType.CUSTOMER)
			.build();
	}

	private Member getSeller() {
		return Member.builder()
			.name("SELLER_A")
			.email("seller@test.test")
			.password("password")
			.roleType(RoleType.SELLER)
			.build();
	}
}

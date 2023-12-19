package com.flab.tabling.member.service;

import static org.mockito.Mockito.*;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
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
class MemberServiceTest {
	@InjectMocks
	MemberService memberService;
	@Mock
	MemberRepository memberRepository;

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

	private Member getCustomer() {
		EasyRandomParameters customerParam = new EasyRandomParameters();
		customerParam.randomize(RoleType.class, () -> RoleType.CUSTOMER);
		EasyRandom customerRandom = new EasyRandom(customerParam);
		return customerRandom.nextObject(Member.class);
	}
}

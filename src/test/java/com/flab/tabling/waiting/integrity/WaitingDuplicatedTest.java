package com.flab.tabling.waiting.integrity;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.audit.LoginMemberAuditorAware;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.repository.StoreRepository;
import com.flab.tabling.waiting.exception.WaitingDuplicatedException;
import com.flab.tabling.waiting.repository.WaitingRepository;
import com.flab.tabling.waiting.service.WaitingService;

import jakarta.persistence.EntityManager;

@SpringBootTest
public class WaitingDuplicatedTest {
	@Autowired
	WaitingService waitingService;
	@Autowired
	WaitingRepository waitingRepository;
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	StoreRepository storeRepository;
	@Autowired
	EntityManager entityManager;
	@MockBean
	LoginMemberAuditorAware loginMemberAuditorAware;

	@Test
	@Transactional
	@DisplayName("하나의 식당에 동일한 회원이 중복 요청할 경우 WaitingDuplicatedException 가 발생한다.")
	public void failSaveByDuplicatedMember() {
		//given
		Member member = memberRepository.findById(2L).get();
		Store store = storeRepository.findById(1L).get();

		//expected
		waitingService.add(store, member, 3);
		assertThrows(WaitingDuplicatedException.class, () -> waitingService.add(store, member, 3));
	}
}

package com.flab.tabling.waiting.integrity;

import static com.flab.tabling.waiting.domain.WaitingStatus.*;
import static org.assertj.core.api.Assertions.*;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.audit.LoginMemberAuditorAware;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.repository.StoreRepository;
import com.flab.tabling.waiting.facade.WaitingFacade;
import com.flab.tabling.waiting.repository.WaitingRepository;
import com.flab.tabling.waiting.service.WaitingService;

import jakarta.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class WaitingFacadeConcurrencyTest {

	@Autowired
	WaitingService waitingService;
	@Autowired
	WaitingFacade waitingFacade;
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
	private Long memberIdx = 2L;

	@Test
	@Transactional(isolation = Isolation.READ_UNCOMMITTED)
	@DisplayName("다수의 사용자가 동시에 대기 요청해도 최대 대기 가능 인원수를 초과하지 않는다.")
	void concurrencyTest() throws InterruptedException {
		//given
		Store store = storeRepository.findById(1L).get();

		//when
		executeConcurrentRequests(store.getId());

		//then
		int countAfterConcurrentRequests = waitingRepository.countByStoreAndStatus(store, ONGOING);
		assertThat(countAfterConcurrentRequests).isEqualTo(store.getMaxWaitingCount());
		entityManager.createNativeQuery("delete from waiting where id > " + 1L).executeUpdate();
	}

	private void executeConcurrentRequests(Long storeId) throws InterruptedException {
		ExecutorService executorService = Executors.newFixedThreadPool(10);
		for (int i = 0; i < 8; i++) {
			executorService.execute(() -> waitingFacade.add(storeId, memberIdx++, 3));
		}
		Thread.sleep(1000);
	}
}

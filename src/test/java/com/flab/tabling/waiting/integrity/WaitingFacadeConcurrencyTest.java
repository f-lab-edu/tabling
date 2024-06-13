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
import org.springframework.test.annotation.Commit;
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

/*
@Commit: @Transactional 이 적용된 테스트 코드를 커밋할 수 있습니다.
 */
@SpringBootTest
public class WaitingFacadeConcurrencyTest {
	static final int WAITING_SAMPLE_DATA_SIZE = 11;
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
	Long idx = 8L;

	@Test
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Commit
	@DisplayName("다수의 사용자가 동시에 대기 요청해도 최대 대기 가능 인원수를 초과하지 않는다.")
	void concurrencyTest() throws InterruptedException {
		//given
		Store store = storeRepository.findById(1L).get();

		//when
		executeConcurrentRequests();
		Thread.sleep(1000);
		entityManager.flush();
		entityManager.clear();

		//then
		int countAfterConcurrentRequests = waitingRepository.countByStoreAndStatus(store, ONGOING);
		assertThat(countAfterConcurrentRequests).isEqualTo(store.getMaxWaitingCount());
		entityManager.createNativeQuery("delete from waiting where id > " + WAITING_SAMPLE_DATA_SIZE).executeUpdate();
	}

	private void executeConcurrentRequests() {
		ExecutorService executorService = Executors.newFixedThreadPool(10);
		for (int i = 0; i < 8; i++) {
			executorService.execute(() -> waitingFacade.add(1L, idx++, 3));
		}
	}
}

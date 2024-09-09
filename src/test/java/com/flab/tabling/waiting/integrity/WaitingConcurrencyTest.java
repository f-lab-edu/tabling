package com.flab.tabling.waiting.integrity;

import static com.flab.tabling.waiting.domain.WaitingStatus.*;
import static org.assertj.core.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.Commit;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.audit.LoginMemberAuditorAware;
import com.flab.tabling.member.domain.Member;
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
public class WaitingConcurrencyTest {
	static final int WAITING_SAMPLE_DATA_SIZE = 11;
	@Autowired
	WaitingFacade waitingFacade;
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
	int idx = 0;

	@Test
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Commit
	@DisplayName("다수의 사용자가 동시에 대기 요청해도 최대 대기 가능 인원수를 초과하지 않는다.")
	void concurrencyTest() throws InterruptedException {
		//given
		Store store = storeRepository.findById(1L).get();
		List<Member> members = getMembers();

		//when
		executeConcurrentRequests(store, members);
		Thread.sleep(1000);
		entityManager.flush();
		entityManager.clear();

		//then
		int countAfterConcurrentRequests = waitingRepository.countWithPessimisticLockByStoreAndStatus(store, ONGOING);
		assertThat(countAfterConcurrentRequests).isEqualTo(store.getMaxWaitingCount());
		entityManager.createNativeQuery("delete from waiting where id > " + WAITING_SAMPLE_DATA_SIZE).executeUpdate();
	}

	@Test
	@Transactional
	@Commit
	@DisplayName("test")
	void test1() throws InterruptedException {
		int threadPoolSize = 10;  // 스레드 풀의 크기 설정
		ExecutorService executor = Executors.newFixedThreadPool(threadPoolSize);  // 고정된 스레드 풀 생성

		// 시작 시간 측정
		long startTime = System.currentTimeMillis();

		Integer headCount = 3;  // 고정된 값
		for (int i = 0; i < 10; i++) {
			try {
				Thread.sleep(150);  // 각 요청 사이에 100밀리초(0.1초) 대기
			} catch (InterruptedException e) {
				Thread.currentThread().interrupt();
				throw new RuntimeException(e);
			}

			Long storeId = generateRandomStoreId();
			Long memberId = generateRandomMemberId();
			executor.execute(() -> waitingFacade.add(storeId, memberId, headCount));
		}

		executor.shutdown();  // 더 이상 새로운 작업을 받지 않고, 기존 작업이 끝나면 Executor를 종료
		try {
			if (!executor.awaitTermination(60, TimeUnit.SECONDS)) {
				executor.shutdownNow();  // 60초 내에 종료되지 않으면 강제 종료
			}
		} catch (InterruptedException e) {
			executor.shutdownNow();
		}

		// 종료 시간 측정
		long endTime = System.currentTimeMillis();
		long totalTime = endTime - startTime;

		// 총 소요 시간 출력
		System.out.println("Total time taken: " + totalTime + " milliseconds");
	}

	private Long generateRandomStoreId() {
		return ThreadLocalRandom.current().nextLong(2, 20000001);  // storeId 범위 2~20000000
	}

	private Long generateRandomMemberId() {
		return ThreadLocalRandom.current().nextLong(2, 10001);  // memberId 범위 2~10000
	}

	private void executeConcurrentRequests(Store store, List<Member> members) {
		ExecutorService executorService = Executors.newFixedThreadPool(10);
		for (int i = 0; i < 8; i++) {
			executorService.execute(() -> waitingService.add(store, members.get(idx++), 3));
		}
	}

	private List<Member> getMembers() {
		List<Member> members = new ArrayList<>();
		for (int i = 8; i < 16; i++) {
			members.add(memberRepository.findById((long)i).get());
		}
		return members;
	}
}

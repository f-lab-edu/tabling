package com.flab.tabling.waiting;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Component;

import com.flab.tabling.waiting.facade.WaitingFacade;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class WaitingAddLoadTestAsync {

	private final WaitingFacade waitingFacade;  // add 메서드를 포함한 서비스

	public void runAsyncTest(int numRequests) {
		int threadPoolSize = 10;  // 스레드 풀의 크기 설정
		ExecutorService executor = Executors.newFixedThreadPool(threadPoolSize);  // 고정된 스레드 풀 생성

		// 시작 시간 측정
		long startTime = System.currentTimeMillis();

		Integer headCount = 3;  // 고정된 값
		for (int i = 0; i < numRequests; i++) {
			try {
				Thread.sleep(100);  // 각 요청 사이에 100밀리초(0.1초) 대기
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
		log.info("Total time taken: " + totalTime + " milliseconds");
	}

	private Long generateRandomStoreId() {
		return ThreadLocalRandom.current().nextLong(2, 20000001);  // storeId 범위 2~20000000
	}

	private Long generateRandomMemberId() {
		return ThreadLocalRandom.current().nextLong(2, 10001);  // memberId 범위 2~10000
	}
}

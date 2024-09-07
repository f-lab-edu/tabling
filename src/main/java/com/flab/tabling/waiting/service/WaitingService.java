package com.flab.tabling.waiting.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.domain.Waiting;
import com.flab.tabling.waiting.domain.WaitingStatus;
import com.flab.tabling.waiting.exception.WaitingDuplicatedException;
import com.flab.tabling.waiting.exception.WaitingExceededException;
import com.flab.tabling.waiting.exception.WaitingNotFoundException;
import com.flab.tabling.waiting.repository.WaitingRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WaitingService {
	private final WaitingRepository waitingRepository;

	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Waiting add(Store store, Member member, Integer headCount) {
		checkWaitingQueueFull(store);
		checkDuplicatedWaiting(store, member);
		Waiting waiting = Waiting.builder()
			.store(store)
			.member(member)
			.headCount(headCount)
			.waitingStatus(WaitingStatus.ONGOING)
			.build();
		waitingRepository.save(waiting);
		return waiting;
	}

	@Transactional
	public void cancelMember(Store store, Member member, Long waitingId) {
		Waiting waiting = waitingRepository.findByMemberAndStoreAndStatus(member, store, WaitingStatus.ONGOING)
			.orElseThrow(() -> new WaitingNotFoundException(ErrorCode.PARAMETER_NOT_FOUND,
				"waiting for given store not found"));
		if (!waitingId.equals(waiting.getId())) {
			throw new WaitingNotFoundException(ErrorCode.PARAMETER_NOT_FOUND, "The given waiting is not yours");
		}
		waitingRepository.delete(waiting);
	}

	@Transactional
	public void cancelFirst(Store store) {
		Waiting waiting = waitingRepository.findFirstByStoreAndStatusOrderByCreatedAt(store, WaitingStatus.ONGOING)
			.orElseThrow(() -> new WaitingNotFoundException(ErrorCode.STORE_NOT_FOUND,
				"waiting for given store is empty"));
		waitingRepository.delete(waiting);
	}

	@Transactional
	public void acceptFirst(Store store) {
		Waiting waiting = waitingRepository.findFirstByStoreAndStatus(store, WaitingStatus.ONGOING)
			.orElseThrow(() -> new WaitingNotFoundException(ErrorCode.STORE_NOT_FOUND,
				"waiting for given store is empty"));
		waiting.accept();
	}

	private void checkWaitingQueueFull(Store store) {
		Integer count = waitingRepository.countByStoreAndStatus(store, WaitingStatus.ONGOING);
		if (count >= store.getMaxWaitingCount()) { // TODO: 2024-09-07 대기 가능 여부를 Store 도메인 내부에서 판단하는 방법 고려
			throw new WaitingExceededException(ErrorCode.INVALID_PARAMETER, "waiting queue is full");
		}
	}

	private void checkDuplicatedWaiting(Store store, Member member) {
		if (waitingRepository.findByMemberAndStoreAndStatus(member, store, WaitingStatus.ONGOING).isPresent()) {
			throw new WaitingDuplicatedException(ErrorCode.PARAMETER_DUPLICATED,
				"waiting for given store already exists");
		}
	}
}

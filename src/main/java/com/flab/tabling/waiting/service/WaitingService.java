package com.flab.tabling.waiting.service;

import java.util.Optional;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.domain.Status;
import com.flab.tabling.waiting.domain.Waiting;
import com.flab.tabling.waiting.exception.WaitingDuplicatedException;
import com.flab.tabling.waiting.exception.WaitingNotFoundException;
import com.flab.tabling.waiting.repository.WaitingRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WaitingService {
	private final WaitingRepository waitingRepository;
	public Waiting add(Store store, Member member, Integer headCount) {
		checkWaitingQueueFull(store);
		if (waitingRepository.findByMemberAndStoreAndStatus(member, store, Status.WAITING).isPresent()) {
			throw new WaitingDuplicatedException(ErrorCode.PARAMETER_DUPLICATED, "waiting for given store already exists");
		}
		Waiting waiting = Waiting.builder()
			.store(store)
			.member(member)
			.headCount(headCount)
			.status(Status.WAITING)
			.build();
		try {
			waitingRepository.save(waiting);
		} catch (DataIntegrityViolationException e) {
			throw new WaitingDuplicatedException(ErrorCode.PARAMETER_DUPLICATED, "waiting for given store already exists");
		}
		return waiting;
	}

	public void cancelMemberOfStore(Store store, Member member) {
		Waiting waiting = waitingRepository.findByMemberAndStoreAndStatus(member, store, Status.WAITING)
			.orElseThrow(() -> new WaitingNotFoundException(ErrorCode.PARAMETER_NOT_FOUND,
				"waiting for given store not found"));
		waitingRepository.delete(waiting);
	}

	public void cancelFirstOfStore(Store store) {
		Waiting waiting = waitingRepository.findFirstByStoreAndStatus(store, Status.WAITING)
			.orElseThrow(() -> new WaitingNotFoundException(ErrorCode.STORE_NOT_FOUND,
				"waiting for given store is empty"));
		waitingRepository.delete(waiting);
	}

	public void acceptFirstOfStore(Store store) {
		Waiting waiting = waitingRepository.findFirstByStoreAndStatusByPessimisticLock(store, Status.WAITING)
			.orElseThrow(() -> new WaitingNotFoundException(ErrorCode.STORE_NOT_FOUND,
				"waiting for given store is empty"));
		waiting.accept();
	}

	private void checkWaitingQueueFull(Store store) {
		Integer count = waitingRepository.countWithPessimisticLockByStoreAndStatus(store, Status.WAITING);
		if (count >= store.getMaxWaitingCount()) {
			throw new WaitingDuplicatedException(ErrorCode.INVALID_PARAMETER, "waiting queue is full");
		}
	}
}

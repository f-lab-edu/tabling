package com.flab.tabling.waiting.facade;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.repository.NamedLockRepository;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.service.MemberQueryService;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.service.StoreQueryService;
import com.flab.tabling.store.service.StoreService;
import com.flab.tabling.waiting.domain.Waiting;
import com.flab.tabling.waiting.dto.WaitingAddDto;
import com.flab.tabling.waiting.service.WaitingService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class WaitingFacade {
	private final StoreService storeService;
	private final StoreQueryService storeQueryService;
	private final MemberQueryService memberQueryService;
	private final WaitingService waitingService;
	private final NamedLockRepository namedLockRepository;
	// private final BusinessHourQueryService businessHourQueryService;
	//TODO: Business Hour 검증 로직 추가

	@Transactional
	public WaitingAddDto.Response add(Long storeId, Long memberId, Integer headCount) {
		Store store = storeQueryService.getStore(storeId);
		Member member = memberQueryService.getMember(memberId);
		String lockKey = String.valueOf(storeId);
		Waiting waiting = addWaitingWithNamedLock(lockKey, store, member, headCount);
		return new WaitingAddDto.Response(waiting.getId());
	}

	@Transactional
	public void cancelByMember(Long storeId, Long memberId, Long waitingId) {
		Store store = storeQueryService.getStore(storeId);
		Member member = memberQueryService.getMember(memberId);
		waitingService.cancelMember(store, member, waitingId);
	}

	@Transactional
	public void cancelFirst(Long sellerId, Long storeId) {
		Store store = storeQueryService.getStore(storeId);
		storeService.validateAuth(store, sellerId);
		waitingService.cancelFirst(store);
	}

	@Transactional
	public void acceptFirst(Long sellerId, Long storeId) {
		Store store = storeQueryService.getStore(storeId);
		storeService.validateAuth(store, sellerId);
		waitingService.acceptFirst(store);
	}

	private Waiting addWaitingWithNamedLock(String lockKey, Store store, Member member, Integer headCount) {
		Waiting waiting;
		try {
			namedLockRepository.getLock(lockKey);
			waiting = waitingService.add(store, member, headCount);
		} finally {
			namedLockRepository.releaseLock(lockKey);
		}
		return waiting;
	}
}

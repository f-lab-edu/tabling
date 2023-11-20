package com.flab.tabling.waiting.facade;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.service.MemberService;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.service.StoreService;
import com.flab.tabling.waiting.domain.Waiting;
import com.flab.tabling.waiting.dto.WaitingAddDto;
import com.flab.tabling.waiting.service.WaitingService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class WaitingFacade {
	private final StoreService storeService;
	private final MemberService memberService;
	private final WaitingService waitingService;
	// private final BusinessHourQueryService businessHourQueryService;
	//TODO: Business Hour 검증 로직 추가

	@Transactional
	public WaitingAddDto.Response addMember(Long storeId, Long memberId, Integer headCount) {
		Store store = storeService.getStore(storeId);
		Member member = memberService.getMember(memberId);
		Waiting waiting = waitingService.add(store, member, headCount);
		return new WaitingAddDto.Response(waiting.getId());
	}

	@Transactional
	public void cancelByMySelf(Long storeId, Long memberId) {
		Store store = storeService.getStore(storeId);
		Member member = memberService.getMember(memberId);
		waitingService.cancelMemberOfStore(store, member);
	}
	@Transactional
	public void cancelByStore(Long sellerId, Long storeId) {
		Store store = storeService.getStore(storeId);
		storeService.validateAuth(store, sellerId);
		waitingService.cancelFirstOfStore(store);
	}

	@Transactional
	public void acceptByStore(Long sellerId, Long storeId) {
		Store store = storeService.getStore(storeId);
		storeService.validateAuth(store, sellerId);
		waitingService.acceptFirstOfStore(store);
	}

}

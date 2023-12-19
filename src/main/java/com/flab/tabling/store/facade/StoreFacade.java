package com.flab.tabling.store.facade;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.service.MemberQueryService;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.service.StoreQueryService;
import com.flab.tabling.store.service.StoreService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class StoreFacade {

	private final StoreService storeService;
	private final StoreQueryService storeQueryService;
	private final MemberQueryService memberQueryService;

	public StoreAddDto.Response add(StoreAddDto.Request storeAddRequest, Long memberId) {
		Member seller = memberQueryService.getMember(memberId);
		return storeService.add(storeAddRequest, seller);
	}

	public StoreFindDto.Response find(Long storeId) {
		return storeQueryService.find(storeId);
	}

	public Page<StoreFindDto.Response> findPage(Pageable pageable) {
		return storeQueryService.findPage(pageable);
	}

	@Transactional
	public StoreUpdateDto.Response update(StoreUpdateDto.Request storeUpdateRequest, Long sessionMemberId) {
		Store targetStore = storeQueryService.getStore(storeUpdateRequest.getId());
		storeService.validateAuth(targetStore, sessionMemberId);
		return storeService.update(targetStore, storeUpdateRequest);
	}

	public void delete(Long storeId, Long sessionMemberId) {
		Store targetStore = storeQueryService.getStore(storeId);
		storeService.validateAuth(targetStore, sessionMemberId);
		storeService.delete(targetStore);
	}
}

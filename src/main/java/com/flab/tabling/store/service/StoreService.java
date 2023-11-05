package com.flab.tabling.store.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.exception.AuthorizationException;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.exception.StoreNotFoundException;
import com.flab.tabling.store.repository.StoreRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {
	private final MemberRepository memberRepository;
	private final StoreRepository storeRepository;

	@Transactional
	public StoreAddDto.Response add(StoreAddDto.Request storeRequestDto, Long memberId) {
		Member seller = getMember(memberId);

		Store newStore = Store.builder()
			.member(seller)
			.name(storeRequestDto.getName())
			.category(storeRequestDto.getCategory())
			.description(storeRequestDto.getDescription())
			.maxWaitingCount(storeRequestDto.getMaxWaitingCount())
			.build();

		Store savedStore = storeRepository.save(newStore);
		return new StoreAddDto.Response(savedStore.getId());
	}

	@Transactional(readOnly = true)
	public StoreFindDto.Response find(Long storeId) {
		Store queriedStore = getStore(storeId);
		return new StoreFindDto.Response(queriedStore);
	}

	@Transactional(readOnly = true)
	public Page<StoreFindDto.Response> findPage(Pageable pageable) {
		return storeRepository.findAll(pageable).map(StoreFindDto.Response::new);
	}

	@Transactional
	public StoreUpdateDto.Response update(StoreUpdateDto.Request storeUpdateRequest, Long sessionMemberId) {
		Store targetStore = getStore(storeUpdateRequest.getId());
		validateAuth(targetStore, sessionMemberId);
		updateStore(targetStore, storeUpdateRequest);
		return new StoreUpdateDto.Response(storeUpdateRequest.getId());
	}

	@Transactional
	public void delete(Long storeId, Long sessionMemberId) {
		Store targetStore = getStore(storeId);
		validateAuth(targetStore, sessionMemberId);
		storeRepository.delete(targetStore);
	}

	@Transactional(readOnly = true)
	public void validateAuth(Store targetStore, Long memberId) {
		Member seller = targetStore.getMember();
		if (seller.getId() != memberId) {
			throw new AuthorizationException(ErrorCode.AUTHORIZATION_FAILED, " is not the owner of the store");
		}
	}

	private Member getMember(Long memberId) {
		return memberRepository.findById(memberId)
			.orElseThrow(() -> new MemberNotFoundException(ErrorCode.MEMBER_NOT_FOUND, "member is not found"));
	}

	private Store getStore(Long storeId) {
		return storeRepository.findById(storeId)
			.orElseThrow(() -> new StoreNotFoundException(ErrorCode.STORE_NOT_FOUND, "store is not found"));
	}

	private void updateStore(Store targetStore, StoreUpdateDto.Request storeUpdateRequest) {
		targetStore.update(
			storeUpdateRequest.getName(),
			storeUpdateRequest.getCategory(),
			storeUpdateRequest.getDescription(),
			storeUpdateRequest.getMaxWaitingCount()
		);
	}
}

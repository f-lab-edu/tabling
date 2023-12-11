package com.flab.tabling.store.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.global.exception.AuthorizationException;
import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.repository.StoreRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {

	private final StoreRepository storeRepository;

	public StoreAddDto.Response add(StoreAddDto.Request storeAddRequest, Member seller) {
		Store newStore = Store.builder()
			.member(seller)
			.name(storeAddRequest.getName())
			.category(storeAddRequest.getCategory())
			.description(storeAddRequest.getDescription())
			.maxWaitingCount(storeAddRequest.getMaxWaitingCount())
			.build();
		Store savedStore = storeRepository.save(newStore);
		return new StoreAddDto.Response(savedStore.getId());
	}

	@Transactional
	public void update(Store targetStore, StoreUpdateDto.Request storeUpdateRequest) {
		targetStore.update(
			storeUpdateRequest.getName(),
			storeUpdateRequest.getCategory(),
			storeUpdateRequest.getDescription(),
			storeUpdateRequest.getMaxWaitingCount()
		);
	}

	public void delete(Store targetStore) {
		storeRepository.delete(targetStore);
	}

	@Transactional(readOnly = true)
	public void validateAuth(Store targetStore, Long memberId) {
		Member seller = targetStore.getMember();
		if (!seller.getId().equals(memberId)) {
			throw new AuthorizationException(ErrorCode.AUTHORIZATION_FAILED, " is not the owner of the store");
		}
	}
}

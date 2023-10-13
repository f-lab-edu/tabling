package com.flab.tabling.store.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.repository.StoreRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreUpdateService {
	private final StoreRepository storeRepository;

	@Transactional
	public StoreUpdateDto.Response update(StoreUpdateDto.Request storeUpdateRequest, Long sessionMemberId) {
		Store findStore = getStore(storeUpdateRequest.getId());
		validationAuth(findStore, sessionMemberId);
		updateStore(findStore, storeUpdateRequest);
		return StoreUpdateDto.Response.builder()
			.id(storeUpdateRequest.getId())
			.build();
	}

	private Store getStore(Long storeId) {
		return storeRepository.findById(storeId)
			.orElseThrow(RuntimeException::new); // TODO: 2023-10-10 커스텀 예외로 수정 필요
	}

	private void validationAuth(Store findStore, Long memberId) {
		Member seller = findStore.getMember();
		if (seller.getId() != memberId) {
			throw new RuntimeException("요청한 사용자와 수정 대상인 가게의 주인이 일치하지 않는다."); // TODO: 2023-10-13 커스텀 예외로 수정 필요
		}
	}

	private void updateStore(Store findStore, StoreUpdateDto.Request storeUpdateRequest) {
		findStore.updateStore(
			storeUpdateRequest.getName(),
			storeUpdateRequest.getCategory(),
			storeUpdateRequest.getDescription(),
			storeUpdateRequest.getMaxWaitingCount()
		);
	}
}

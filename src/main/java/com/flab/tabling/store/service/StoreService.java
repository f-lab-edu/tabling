package com.flab.tabling.store.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.repository.StoreRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {
	private final StoreRepository storeRepository;
	private final MemberRepository memberRepository;

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
		return StoreAddDto.Response.builder()
			.id(savedStore.getId())
			.build();
	}

	@Transactional
	public StoreUpdateDto.Response update(StoreUpdateDto.Request storeUpdateRequest, Long sessionMemberId) {
		Store findStore = getStore(storeUpdateRequest.getId());
		validationAuth(findStore, sessionMemberId);
		updateStore(findStore, storeUpdateRequest);
		return StoreUpdateDto.Response.builder()
			.id(storeUpdateRequest.getId())
			.build();
	}

	@Transactional
	public void delete(Long storeId, Long sessionMemberId) {
		Store findStore = getStore(storeId);
		validationAuth(findStore, sessionMemberId);
		storeRepository.delete(findStore);
	}

	@Transactional(readOnly = true)
	public void validationAuth(Store findStore, Long memberId) {
		Member seller = findStore.getMember();
		if (seller.getId() != memberId) {
			throw new RuntimeException("요청한 사용자와 수정 대상인 가게의 주인이 일치하지 않는다."); // TODO: 2023-10-13 커스텀 예외로 수정 필요
		}
	}

	private Member getMember(Long memberId) {
		return memberRepository.findById(memberId)
			.orElseThrow(RuntimeException::new); // TODO: 2023-10-03 커스텀 예외로 수정 필요
	}

	private Store getStore(Long storeId) {
		return storeRepository.findById(storeId)
			.orElseThrow(RuntimeException::new); // TODO: 2023-10-13 커스텀 예외로 수정 필요
	}

	private void updateStore(Store findStore, StoreUpdateDto.Request storeUpdateRequest) {
		findStore.update(
			storeUpdateRequest.getName(),
			storeUpdateRequest.getCategory(),
			storeUpdateRequest.getDescription(),
			storeUpdateRequest.getMaxWaitingCount()
		);
	}
}

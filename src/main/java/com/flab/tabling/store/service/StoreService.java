package com.flab.tabling.store.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
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
		validationAuth(targetStore, sessionMemberId);
		updateStore(targetStore, storeUpdateRequest);
		return new StoreUpdateDto.Response(storeUpdateRequest.getId());
	}

	@Transactional
	public void delete(Long storeId, Long sessionMemberId) {
		Store targetStore = getStore(storeId);
		validationAuth(targetStore, sessionMemberId);
		storeRepository.delete(targetStore);
	}

	@Transactional(readOnly = true)
	public void validationAuth(Store targetStore, Long memberId) {
		Member seller = targetStore.getMember();
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

	private void updateStore(Store targetStore, StoreUpdateDto.Request storeUpdateRequest) {
		targetStore.update(
			storeUpdateRequest.getName(),
			storeUpdateRequest.getCategory(),
			storeUpdateRequest.getDescription(),
			storeUpdateRequest.getMaxWaitingCount()
		);
	}
}

package com.flab.tabling.store.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
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

	private Member getMember(Long memberId) {
		return memberRepository.findById(memberId)
			.orElseThrow(RuntimeException::new); // TODO: 2023-10-03 커스텀 예외로 수정 필요
	}
}

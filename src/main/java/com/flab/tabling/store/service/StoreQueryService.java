package com.flab.tabling.store.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.repository.StoreRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreQueryService {
	private final StoreRepository storeRepository;

	@Transactional(readOnly = true)
	public StoreFindDto.Response find(Long storeId) {
		Store findStore = getStore(storeId);
		return new StoreFindDto.Response(findStore);
	}

	@Transactional(readOnly = true)
	public Page<StoreFindDto.Response> findPage(Pageable pageable) {
		return storeRepository.findAll(pageable).map(StoreFindDto.Response::new);
	}

	private Store getStore(Long storeId) {
		return storeRepository.findById(storeId)
			.orElseThrow(RuntimeException::new); // TODO: 2023-10-08 커스텀 예외로 교체 필요
	}
}

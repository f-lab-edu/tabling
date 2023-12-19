package com.flab.tabling.store.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.flab.tabling.global.exception.ErrorCode;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.exception.StoreNotFoundException;
import com.flab.tabling.store.repository.StoreRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreQueryService {

	private final StoreRepository storeRepository;

	public Store getStore(Long id) {
		return storeRepository.findById(id)
			.orElseThrow(() -> new StoreNotFoundException(ErrorCode.STORE_NOT_FOUND,
				"store with this id " + id + " is not found"));
	}

	public StoreFindDto.Response find(Long id) {
		Store queriedStore = getStore(id);
		return new StoreFindDto.Response(queriedStore);
	}

	public Page<StoreFindDto.Response> findPage(Pageable pageable) {
		return storeRepository.findAll(pageable).map(StoreFindDto.Response::new);
	}
}

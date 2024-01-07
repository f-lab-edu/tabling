package com.flab.tabling.store.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flab.tabling.store.domain.Store;

public interface StoreRepository extends JpaRepository<Store, Long> {

	List<Store> findStoresByName(String name);
}

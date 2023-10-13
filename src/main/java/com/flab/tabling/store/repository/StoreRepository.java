package com.flab.tabling.store.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flab.tabling.store.domain.Store;

public interface StoreRepository extends JpaRepository<Store, Long> {
}

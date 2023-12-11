package com.flab.tabling.store.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;

public interface StoreRepository extends JpaRepository<Store, Long> {
	public Optional<Store> findStoreByMember(Member member);
}

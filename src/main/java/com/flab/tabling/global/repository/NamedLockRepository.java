package com.flab.tabling.global.repository;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NamedLockRepository {

	private final EntityManager entityManager;

	public void getLock(String key) {
		entityManager.createNativeQuery("select get_lock(:key, 3000)").setParameter("key", key).getSingleResult();
	}

	public void releaseLock(String key) {
		entityManager.createNativeQuery("select release_lock(:key)").setParameter("key", key).getSingleResult();
	}
}

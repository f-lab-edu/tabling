package com.flab.tabling.global.service.lock;

import java.util.concurrent.TimeUnit;

import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
// @Component
@RequiredArgsConstructor
public class NamedLockService implements DistributedLockService{

	private final EntityManager entityManager;

	public void lock(String key, long timeout, TimeUnit unit) {
		if(!unit.equals(TimeUnit.SECONDS)) {
			timeout = unit.toSeconds(timeout);
		}
		entityManager.createNativeQuery("select get_lock(:key, :timeout)")
			.setParameter("key", key)
			.setParameter("timeout", timeout)
			.getSingleResult();
	}

	public void unlock(String key) {
		entityManager.createNativeQuery("select release_lock(:key)")
			.setParameter("key", key)
			.getSingleResult();
	}
}

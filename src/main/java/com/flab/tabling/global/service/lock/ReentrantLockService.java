package com.flab.tabling.global.service.lock;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
// @Component
public class ReentrantLockService {
	private final ConcurrentHashMap<String, ReentrantLock> lockMap = new ConcurrentHashMap<>();

	private ReentrantLock getLock(String key) {
		lockMap.putIfAbsent(key, new ReentrantLock(true));
		return lockMap.get(key);
	}

	public void lock(String key, long timeout, TimeUnit unit) {
		ReentrantLock lock = getLock(key);
		try {
			if (!lock.tryLock(timeout, unit)) {
				throw new RuntimeException(
					"Failed to acquire lock for key: " + key + " within timeout: " + timeout + " " + unit);
			}
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			throw new RuntimeException("Thread was interrupted while trying to acquire lock for key: " + key, e);
		}
	}

	public void unlock(String key) {
		ReentrantLock lock = getLock(key);
		if (lock.isHeldByCurrentThread()) {
			lock.unlock();
			if (!lock.hasQueuedThreads()) {
				lockMap.remove(key);
			}
		}
	}
}

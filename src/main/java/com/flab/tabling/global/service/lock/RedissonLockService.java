package com.flab.tabling.global.service.lock;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class RedissonLockService implements DistributedLockService{
	private final RedissonClient redissonClient;

	@Override
	public void lock(String key, long timeout, TimeUnit unit) {
		RLock lock = redissonClient.getLock(key);
		try {
			lock.tryLock(timeout, unit);
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			throw new IllegalStateException("Lock acquisition interrupted for key: " + key, e);
		}
	}

	@Override
	public void unlock(String key) {
		redissonClient.getLock(key).unlock();
	}
}

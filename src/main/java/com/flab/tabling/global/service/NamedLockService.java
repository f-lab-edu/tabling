package com.flab.tabling.global.service;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.RedisScript;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class NamedLockService {
	private final RedisTemplate<String, String> redisTemplate;
	private final RedisScript<Boolean> lockScript;
	private final RedisScript<Long> unlockScript;

	public NamedLockService(RedisTemplate<String, String> redisTemplate) {
		this.redisTemplate = redisTemplate;
		this.lockScript = RedisScript.of("return redis.call('set', KEYS[1], ARGV[1], 'NX', 'PX', ARGV[2])", Boolean.class);
		this.unlockScript = RedisScript.of("if redis.call('get', KEYS[1]) == ARGV[1] then return redis.call('del', KEYS[1]) else return 0 end", Long.class);
	}


	public boolean lock(String key, long timeout, TimeUnit unit) {
		String lockValue = Thread.currentThread().getId() + ":";
		long timeoutMillis = unit.toMillis(timeout);
		return Boolean.TRUE.equals(redisTemplate.execute(lockScript, java.util.Collections.singletonList(key), lockValue, Long.toString(timeoutMillis)));
	public void lock(String key, long timeout, TimeUnit unit) {

	public void unlock(String key) {
		String lockValue = Thread.currentThread().getId() + ":";
		redisTemplate.execute(unlockScript, java.util.Collections.singletonList(key), lockValue);
	public void unlock(String key) {
	}
}

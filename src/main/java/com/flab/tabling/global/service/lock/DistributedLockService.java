package com.flab.tabling.global.service.lock;

import java.util.concurrent.TimeUnit;

public interface DistributedLockService {
	void lock(String key, long timeout, TimeUnit unit);

	void unlock(String key);
}

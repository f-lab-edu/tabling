package com.flab.tabling.store;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.jeasy.random.FieldPredicates;

import com.flab.tabling.store.domain.Store;

public class StoreFixture {
	public Store getStore(Long id) {
		EasyRandomParameters storeConditions = new EasyRandomParameters()
			.randomize(FieldPredicates.named("id"), () -> id);
		EasyRandom storeRandom = new EasyRandom(storeConditions);
		return storeRandom.nextObject(Store.class);
	}
}

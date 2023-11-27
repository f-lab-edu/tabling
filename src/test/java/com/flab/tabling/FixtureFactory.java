package com.flab.tabling;

import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.store.StoreFixture;

public class FixtureFactory {
	private static final StoreFixture storeFixture = new StoreFixture();
	private static final BusinessHourFixture businessHourFixture = new BusinessHourFixture();

	public static StoreFixture storeFixture() {
		return storeFixture;
	}

	public static BusinessHourFixture businessHourFixture() {
		return businessHourFixture;
	}
}

package com.flab.tabling.waiting.fixture;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.jeasy.random.randomizers.number.AtomicLongRandomizer;
import org.jeasy.random.randomizers.range.IntegerRangeRandomizer;
import org.jeasy.random.randomizers.range.LongRangeRandomizer;
import org.jeasy.random.randomizers.text.StringRandomizer;
import org.junit.jupiter.api.Test;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.domain.RoleType;
import com.flab.tabling.store.domain.Category;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.domain.Status;
import com.flab.tabling.waiting.domain.Waiting;

public final class WaitingFixture {
	private static EasyRandom easyRandom = new EasyRandom();
	private static StringRandomizer stringRandomizer = new StringRandomizer(30);
	private static LongRangeRandomizer longRangeRandomizer = new LongRangeRandomizer(1L, 1000L);
	private static IntegerRangeRandomizer integerRangeRandomizer = new IntegerRangeRandomizer(1, 10);

	public static Waiting getWaiting(Store store, Member member) {
		return new MockWaiting(store, member, integerRangeRandomizer.getRandomValue(), Status.WAITING);
	}

	public static Store getStore(Member member) {
		return new MockStore(member, stringRandomizer.getRandomValue(), easyRandom.nextObject(Category.class),
			stringRandomizer.getRandomValue(), longRangeRandomizer.getRandomValue().intValue());
	}

	public static Member getMember() {
		return new MockMember(stringRandomizer.getRandomValue(), stringRandomizer.getRandomValue(),
			stringRandomizer.getRandomValue(), easyRandom.nextObject(RoleType.class));
	}


	private static class MockStore extends Store {
		private Long mockId = longRangeRandomizer.getRandomValue();
		private MockStore(Member member, String name, Category category, String description,
			Integer maxWaitingCount) {
			super(member, name, category, description, maxWaitingCount);
		}

		@Override
		public Long getId() {
			return mockId;
		}
	}

	private static class MockMember extends Member {
		private Long mockId = longRangeRandomizer.getRandomValue();
		private MockMember(String name, String email, String password, RoleType roleType) {
			super(name, email, password, roleType);
		}

		@Override
		public Long getId() {
			return mockId;
		}
	}

	private static class MockWaiting extends Waiting {
		private Long mockId = longRangeRandomizer.getRandomValue();
		public MockWaiting(Store store, Member member, Integer headCount, Status status) {
			super(store, member, headCount, status);
		}

		@Override
		public Long getId() {
			return mockId;
		}
	}


}

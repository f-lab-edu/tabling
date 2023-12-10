package com.flab.tabling.store;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.jeasy.random.FieldPredicates;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;

public class StoreFixture {
	public Store getStore(Long id) {
		EasyRandomParameters storeParameters = new EasyRandomParameters()
			.randomize(FieldPredicates.named("id"), () -> id);
		return new EasyRandom(storeParameters).nextObject(Store.class);
	}

	public Store getStore(Long id, Long memberId) {
		EasyRandomParameters storeParameters = new EasyRandomParameters()
			.randomize(FieldPredicates.named("id"), () -> id)
			.randomize(FieldPredicates.named("member"), () -> getMember(memberId));
		return new EasyRandom(storeParameters).nextObject(Store.class);
	}

	private Member getMember(Long id) { // TODO: 2023-11-19 PR 승인 후, MemberFixture로 이동
		EasyRandomParameters memberParameters = new EasyRandomParameters()
			.randomize(FieldPredicates.named("id"), () -> id);
		return new EasyRandom(memberParameters).nextObject(Member.class);
	}
}

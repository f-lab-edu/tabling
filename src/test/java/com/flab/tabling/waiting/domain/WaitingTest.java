package com.flab.tabling.waiting.domain;

import java.time.LocalDateTime;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.fixture.WaitingFixture;

class WaitingTest {
	private static final String CONJUNCTION = ":";

	@Test
	void generateUniqueKey() {
		//given
		Member member = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(member);
		Waiting waiting = WaitingFixture.getWaiting(store, member);

		//when
		waiting.generateUniqueKey();

		//then
		Assertions.assertThat(waiting.getUniqueKey())
			.isEqualTo(store.getId() + CONJUNCTION + member.getId() + CONJUNCTION + LocalDateTime.now().toLocalDate());
	}
}

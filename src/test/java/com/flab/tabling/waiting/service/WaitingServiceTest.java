package com.flab.tabling.waiting.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.List;
import java.util.Optional;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.domain.Waiting;
import com.flab.tabling.waiting.domain.WaitingStatus;
import com.flab.tabling.waiting.exception.WaitingDuplicatedException;
import com.flab.tabling.waiting.exception.WaitingExceededException;
import com.flab.tabling.waiting.exception.WaitingNotFoundException;
import com.flab.tabling.waiting.fixture.WaitingFixture;
import com.flab.tabling.waiting.repository.WaitingRepository;

@ExtendWith(MockitoExtension.class)
class WaitingServiceTest {

	@InjectMocks
	WaitingService waitingService;

	@Mock
	WaitingRepository waitingRepository;

	@Test
	@DisplayName("대기열 멤버 추가 성공")
	void successAddMember() {
		//given
		Member member = WaitingFixture.getMember();
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		Waiting waiting = WaitingFixture.getWaiting(store, member);
		doReturn(Optional.empty()).when(waitingRepository)
			.findByMemberAndStoreAndStatus(member, store, WaitingStatus.ONGOING);

		//when
		Waiting result = waitingService.add(store, member, waiting.getHeadCount());
		//then
		Assertions.assertThat(List.of(waiting.getMember(), waiting.getStore(), waiting.getHeadCount()))
			.isEqualTo(List.of(result.getMember(), result.getStore(), result.getHeadCount()));
		verify(waitingRepository).save(any(Waiting.class));
	}

	@Test
	@DisplayName("대기열 멤버 추가 실패 : 동일 데이터 생성 시")
	void failAddMemberBySameWaiting() {
		//given
		Member member = WaitingFixture.getMember();
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		Waiting waiting = WaitingFixture.getWaiting(store, member);
		doReturn(Optional.of(waiting)).when(waitingRepository)
			.findByMemberAndStoreAndStatus(member, store, WaitingStatus.ONGOING);
		// //when
		assertThrows(WaitingDuplicatedException.class, () -> waitingService.add(store, member, waiting.getHeadCount()));
	}

	@Test
	@DisplayName("대기열 멤버 추가 실패 : 최대 인원수 초과")
	void failAddMemberByExceedingMaxLimit() {
		//given
		Member member = WaitingFixture.getMember();
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		Waiting waiting = WaitingFixture.getWaiting(store, member);
		doReturn(store.getMaxWaitingCount() + 10).when(waitingRepository)
			.countByStoreAndStatus(store, WaitingStatus.ONGOING);
		//when, then
		assertThrows(WaitingExceededException.class, () -> waitingService.add(store, member, waiting.getHeadCount()));
	}

	@Test
	@DisplayName("대기열 멤버 삭제 성공")
	void successCancelMemberOfStore() {
		//given
		Member member = WaitingFixture.getMember();
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		Waiting waiting = WaitingFixture.getWaiting(store, member);
		doReturn(Optional.of(waiting)).when(waitingRepository)
			.findByMemberAndStoreAndStatus(member, store, WaitingStatus.ONGOING);

		//when
		waitingService.cancelMember(store, member, waiting.getId());

		//then
		verify(waitingRepository).delete(any(Waiting.class));
	}

	@Test
	@DisplayName("대기열 멤버 삭제 실패")
	void failCancelMemberOfStore() {
		//given
		Member member = WaitingFixture.getMember();
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		Waiting waiting = WaitingFixture.getWaiting(store, member);
		doReturn(Optional.empty()).when(waitingRepository)
			.findByMemberAndStoreAndStatus(member, store, WaitingStatus.ONGOING);

		//when, then
		assertThrows(WaitingNotFoundException.class, () -> waitingService.cancelMember(store, member, waiting.getId()));
	}

	@Test
	@DisplayName("가게의 대기열 첫번째 멤버 삭제 성공")
	void successCancelFirstOfStore() {
		//given
		Member member = WaitingFixture.getMember();
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		Waiting waiting = WaitingFixture.getWaiting(store, member);
		doReturn(Optional.of(waiting)).when(waitingRepository)
			.findFirstByStoreAndStatusOrderByCreatedAt(store, WaitingStatus.ONGOING);

		waitingService.cancelFirst(store);
		//when, then
		verify(waitingRepository).delete(any(Waiting.class));
	}

	@Test
	@DisplayName("가게의 대기열 첫번째 멤버 삭제 실패")
	void failCancelFirstOfStore() {
		//given
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		doReturn(Optional.empty()).when(waitingRepository)
			.findFirstByStoreAndStatusOrderByCreatedAt(store, WaitingStatus.ONGOING);

		//when, then
		assertThrows(WaitingNotFoundException.class, () -> waitingService.cancelFirst(store));
	}

	@Test
	@DisplayName("가게의 대기열 첫번째 멤버 입장 성공")
	void successAcceptFirstOfStore() {
		//given
		Member member = WaitingFixture.getMember();
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		Waiting waiting = WaitingFixture.getWaiting(store, member);
		doReturn(Optional.of(waiting)).when(waitingRepository)
			.findFirstByStoreAndStatus(store, WaitingStatus.ONGOING);

		//when
		waitingService.acceptFirst(store);

		//then
		Assertions.assertThat(waiting.getStatus()).isEqualTo(WaitingStatus.COMPLETED);
	}

	@Test
	@DisplayName("가게의 대기열 첫번째 멤버 입장 성공")
	void failAcceptFirstOfStore() {
		//given
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);
		doReturn(Optional.empty()).when(waitingRepository)
			.findFirstByStoreAndStatus(store, WaitingStatus.ONGOING);

		//when, then
		assertThrows(WaitingNotFoundException.class, () -> waitingService.acceptFirst(store));
	}
}

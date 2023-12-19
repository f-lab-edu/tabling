package com.flab.tabling.waiting.facade;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.flab.tabling.global.exception.AuthorizationException;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.service.MemberQueryService;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.service.StoreQueryService;
import com.flab.tabling.store.service.StoreService;
import com.flab.tabling.waiting.domain.Waiting;
import com.flab.tabling.waiting.dto.WaitingAddDto;
import com.flab.tabling.waiting.fixture.WaitingFixture;
import com.flab.tabling.waiting.service.WaitingService;

@ExtendWith(MockitoExtension.class)
class WaitingFacadeTest {

	@InjectMocks
	WaitingFacade waitingFacade;
	@Mock
	StoreService storeService;
	@Mock
	StoreQueryService storeQueryService;
	@Mock
	MemberQueryService memberQueryService;
	@Mock
	WaitingService waitingService;

	@Test
	@DisplayName("사용자 식당 대기열 추가 성공")
	void successAddMember() {
		//given
		Member member = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(member);
		Waiting waiting = WaitingFixture.getWaiting(store, member);
		Long storeId = store.getId();
		Long memberId = member.getId();
		Integer headCount = waiting.getHeadCount();

		//when
		doReturn(store).when(storeQueryService).getStore(storeId);
		doReturn(member).when(memberQueryService).getMember(memberId);
		doReturn(waiting).when(waitingService).add(store, member, headCount);

		//then
		Assertions.assertThat(waitingFacade.add(storeId, memberId, headCount))
			.usingRecursiveComparison().isEqualTo(new WaitingAddDto.Response(waiting.getId()));
	}

	@Test
	@DisplayName("사용자 식당 대기열 삭제 성공")
	void successCancelByMySelf() {
		//given
		Member member = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(member);
		Waiting waiting = WaitingFixture.getWaiting(store, member);

		//when
		waitingFacade.cancelByMember(store.getId(), member.getId(), waiting.getId());

		//then
		verify(storeQueryService).getStore(anyLong());
		verify(memberQueryService).getMember(anyLong());
		verify(waitingService).cancelMember(any(), any(), any());
	}

	@Test
	@DisplayName("식당이 대기열에서 첫번째 고객 예약 취소 성공")
	void successCancelByStore() {
		//given
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);

		//when
		waitingFacade.cancelFirst(store.getId(), seller.getId());

		//then
		verify(storeQueryService).getStore(anyLong());
		verify(storeService).validateAuth(any(), anyLong());
		verify(waitingService).cancelFirst(any());
	}

	@Test
	@DisplayName("식당이 대기열에서 첫번째 고객 입장 실패")
	void failCancelByStore() {
		//given
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);

		//when
		doReturn(store).when(storeQueryService).getStore(store.getId());
		doThrow(AuthorizationException.class).when(storeService).validateAuth(store, seller.getId());

		//then
		assertThrows(AuthorizationException.class, () -> waitingFacade.cancelFirst(seller.getId(), store.getId()));
	}

	@Test
	@DisplayName("식당이 대기열에서 첫번째 고객 입장 성공")
	void successAcceptByStore() {
		//given
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);

		//when
		waitingFacade.acceptFirst(store.getId(), seller.getId());

		//then
		verify(storeQueryService).getStore(anyLong());
		verify(storeService).validateAuth(any(), anyLong());
		verify(waitingService).acceptFirst(any());
	}

	@Test
	@DisplayName("식당이 대기열에서 첫번째 고객 입장 실패")
	void failAcceptByStore() {
		//given
		Member seller = WaitingFixture.getMember();
		Store store = WaitingFixture.getStore(seller);

		//when
		doReturn(store).when(storeQueryService).getStore(store.getId());
		doThrow(AuthorizationException.class).when(storeService).validateAuth(store, seller.getId());

		//then
		assertThrows(AuthorizationException.class, () -> waitingFacade.acceptFirst(seller.getId(), store.getId()));
	}
}

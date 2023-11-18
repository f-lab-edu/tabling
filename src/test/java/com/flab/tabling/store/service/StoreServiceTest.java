package com.flab.tabling.store.service;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.jeasy.random.EasyRandom;
import org.jeasy.random.EasyRandomParameters;
import org.jeasy.random.FieldPredicates;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.flab.tabling.global.exception.AuthorizationException;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.member.exception.MemberNotFoundException;
import com.flab.tabling.member.repository.MemberRepository;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.store.dto.StoreAddDto;
import com.flab.tabling.store.dto.StoreFindDto;
import com.flab.tabling.store.dto.StoreUpdateDto;
import com.flab.tabling.store.exception.StoreNotFoundException;
import com.flab.tabling.store.repository.StoreRepository;

@ExtendWith(MockitoExtension.class)
class StoreServiceTest {
	@InjectMocks
	private StoreService storeService;
	@Mock
	private StoreRepository storeRepository;
	@Mock
	private MemberRepository memberRepository;
	private EasyRandom easyRandom = new EasyRandom();

	@Test
	@DisplayName("식당 등록에 성공하면 식당 id를 포함한 응답이 반환된다.")
	void addStoreSuccess() {
		//given
		Member seller = easyRandom.nextObject(Member.class);
		Store savedStore = easyRandom.nextObject(Store.class);
		StoreAddDto.Request storeRequestDto = easyRandom.nextObject(StoreAddDto.Request.class);

		doReturn(Optional.ofNullable(seller)).when(memberRepository).findById(1L);
		doReturn(savedStore).when(storeRepository).save(any(Store.class));

		//when
		storeService.add(storeRequestDto, 1L);

		//then
		verify(storeRepository, times(1)).save(any(Store.class));
	}

	@Test
	@DisplayName("잘못된 식별자로 회원을 조회할 수 없거나, 회원이 존재하지 않는다면 식당 등록에 실패한다.")
	void addStoreFailWithIncorrectMemberId() {
		//given
		StoreAddDto.Request storeRequestDto = easyRandom.nextObject(StoreAddDto.Request.class);

		doReturn(Optional.empty()).when(memberRepository).findById(1L);
		//expected
		assertThrows(MemberNotFoundException.class, () -> storeService.add(storeRequestDto, 1L));
	}

	@Test
	@DisplayName("식당 id로 조회를 성공하면 응답 dto를 반환한다.")
	void findStoreSuccess() {
		//given
		Store savedStore = easyRandom.nextObject(Store.class);

		doReturn(Optional.ofNullable(savedStore)).when(storeRepository).findById(2L);

		//when
		StoreFindDto.Response storeFindResponse = storeService.find(2L);

		//then
		assertThat(storeFindResponse.getName()).isEqualTo(savedStore.getName());
	}

	@Test
	@DisplayName("전달받은 id로 식당을 조회하지 못하면 예외가 발생한다.")
	void findStoreFailWithInvalidStoreId() {
		//given
		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected
		assertThrows(StoreNotFoundException.class, () -> storeService.find(2L));
	}

	@Test
	@DisplayName("페이지 조건에 맞는 식당 정보 조회에 성공하면 dto 페이지를 전달한다.")
	void findPageSuccessWithPageCondition() {
		//given
		Store storeA = easyRandom.nextObject(Store.class);
		Store storeB = easyRandom.nextObject(Store.class);

		List<Store> storeList = new ArrayList<>();
		storeList.add(storeA);
		storeList.add(storeB);

		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		PageImpl<Store> storePage = new PageImpl<>(storeList, pageable, 1);

		doReturn(storePage).when(storeRepository).findAll(pageable);

		//when
		Page<StoreFindDto.Response> storeFindResponsePage = storeService.findPage(pageable);

		//then
		List<StoreFindDto.Response> pageContent = storeFindResponsePage.getContent();
		StoreFindDto.Response storeAFindResponse = pageContent.get(0);
		StoreFindDto.Response storeBFindResponse = pageContent.get(1);

		assertThat(pageContent.size()).isEqualTo(2);
		assertThat(storeAFindResponse).usingRecursiveComparison().isEqualTo(new StoreFindDto.Response(storeA));
		assertThat(storeBFindResponse).usingRecursiveComparison().isEqualTo(new StoreFindDto.Response(storeB));
	}

	@Test
	@DisplayName("조회할 내용이 없다면 빈 페이지를 반환한다.")
	void findEmptyPageWithNoContent() {
		//given
		Pageable pageable = PageRequest.of(0, 5, Sort.Direction.DESC, "id");
		PageImpl<Store> emptyPage = new PageImpl<>(List.of(), pageable, 1);

		doReturn(emptyPage).when(storeRepository).findAll(pageable);

		//when
		Page<StoreFindDto.Response> storeFindRespnosePage = storeService.findPage(pageable);

		//then
		List<StoreFindDto.Response> pageContent = storeFindRespnosePage.getContent();
		assertThat(pageContent.size()).isEqualTo(0);
	}

	@Test
	@DisplayName("식당이 존재하고, 요청한 사용자가 식당 주인이 맞다면, 성공적으로 수정되고 응답을 반환한다.")
	void updateStoreSuccess() {
		//given
		Store targetStore = getStore(2L);
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);

		doReturn(Optional.ofNullable(targetStore)).when(storeRepository).findById(storeUpdateRequest.getId());

		//when
		StoreUpdateDto.Response result = storeService.update(storeUpdateRequest, 1L);

		//then
		assertThat(result.getId()).isEqualTo(storeUpdateRequest.getId());
	}

	@Test
	@DisplayName("수정 대상 식당이 존재하지 않으면, 수정은 실패하고 예외가 발생한다.")
	void updateStoreFailWithNotFoundStore() {
		//given
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);

		doReturn(Optional.empty()).when(storeRepository).findById(storeUpdateRequest.getId());

		//expected
		assertThrows(StoreNotFoundException.class, () -> storeService.update(storeUpdateRequest, 1L));
	}

	@Test
	@DisplayName("요청한 사용자가 식당 주인이 아니라면, 수정은 실패하고 예외가 발생한다.")
	void updateStoreFailWithNoAuth() {
		//given
		Store targetStore = getStore(2L);
		StoreUpdateDto.Request storeUpdateRequest = easyRandom.nextObject(StoreUpdateDto.Request.class);

		doReturn(Optional.ofNullable(targetStore)).when(storeRepository).findById(storeUpdateRequest.getId());

		//expected
		assertThrows(AuthorizationException.class, () -> storeService.update(storeUpdateRequest, 10L));
	}

	@Test
	@DisplayName("식당이 존재하고, 요청자가 식당 주인이라면, 식당은 성공적으로 삭제되고 아무것도 반환하지 않는다.")
	void deleteStoreSuccess() {
		//given
		Store targetStore = getStore(2L);

		doReturn(Optional.ofNullable(targetStore)).when(storeRepository).findById(2L);

		//when
		storeService.delete(2L, 1L);

		//then
		verify(storeRepository, times(1)).delete(any(Store.class));
	}

	@Test
	@DisplayName("삭제 대상 식당이 존재하지 않으면, 삭제는 실패하고 예외가 발생한다.")
	void deleteStoreFailWithNotFoundStore() {
		//given
		doReturn(Optional.empty()).when(storeRepository).findById(2L);

		//expected
		assertThrows(StoreNotFoundException.class, () -> storeService.delete(2L, 1L));
	}

	@Test
	@DisplayName("요청자가 식당 주인이 아니라면, 삭제는 실패하고 예외가 발생한다.")
	void deleteStoreFailWithNoAuth() {
		Store targetStore = getStore(2L);

		doReturn(Optional.ofNullable(targetStore)).when(storeRepository).findById(2L);

		//expected
		assertThrows(AuthorizationException.class, () -> storeService.delete(2L, 10L));
	}

	@Test
	@DisplayName("요청자가 식당 주인이 맞다면, 검증은 성공하고 아무것도 반환하지 않는다.")
	void validationSuccess() {
		//given
		Store targetStore = getStore(2L);

		//expected
		assertDoesNotThrow(() -> storeService.validateAuth(targetStore, 1L));
	}

	@Test
	@DisplayName("요청자가 식당 주인이 아니라면, 검증은 실패하고 예외가 발생한다.")
	void validationFailWithNoAuth() {
		//given
		Store targetStore = getStore(2L);

		//expected
		assertThrows(AuthorizationException.class, () -> storeService.validateAuth(targetStore, 10L));
	}

	private Store getStore(Long id) {
		EasyRandomParameters storeConditions = new EasyRandomParameters()
			.randomize(Member.class, () -> getMember(1L))
			.randomize(FieldPredicates.named("id"), () -> id);
		EasyRandom storeRandom = new EasyRandom(storeConditions);
		return storeRandom.nextObject(Store.class);
	}

	private Member getMember(Long id) {
		EasyRandomParameters memberConditions = new EasyRandomParameters()
			.randomize(FieldPredicates.named("id"), () -> id);
		EasyRandom memberRandom = new EasyRandom(memberConditions);
		return memberRandom.nextObject(Member.class);
	}
}

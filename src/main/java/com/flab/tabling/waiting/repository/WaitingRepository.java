package com.flab.tabling.waiting.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.domain.Waiting;
import com.flab.tabling.waiting.domain.WaitingStatus;

import jakarta.persistence.LockModeType;

/**
 * @Lock : 비관적 락, 낙관적 락과 관련하여 락 모드를 지정한다.
 * @Query : JPQL 작성, native=true면 native query 작성
 */

public interface WaitingRepository extends JpaRepository<Waiting, Long> {
	Optional<Waiting> findByMemberAndStoreAndStatus(Member member, Store store, WaitingStatus status);

	Optional<Waiting> findFirstByStoreAndStatusOrderByCreatedAt(Store store, WaitingStatus status);

	Optional<Waiting> findFirstByStoreAndStatus(Store store, WaitingStatus status);

	@Lock(LockModeType.PESSIMISTIC_READ)
	Integer countWithPessimisticLockByStoreAndStatus(Store store, WaitingStatus status);

}

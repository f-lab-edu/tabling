package com.flab.tabling.waiting.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.domain.Waiting;
import com.flab.tabling.waiting.domain.WaitingStatus;

/**
 * @Lock : 비관적 락, 낙관적 락과 관련하여 락 모드를 지정한다.
 * @Query : JPQL 작성, native=true면 native query 작성
 */

public interface WaitingRepository extends JpaRepository<Waiting, Long> {
	Optional<Waiting> findByMemberAndStoreAndStatus(Member member, Store store, WaitingStatus status);

	Optional<Waiting> findFirstByStoreAndStatusOrderByCreatedAt(Store store, WaitingStatus status);

	Optional<Waiting> findFirstByStoreAndStatus(Store store, WaitingStatus status);

	@Query(value = "select count(*) from waiting where store_id = :#{#store.id} and status = :#{#status.name} for update", nativeQuery = true)
	Integer countWithPessimisticLockByStoreAndStatus(@Param("store") Store store,
		@Param("status") WaitingStatus status);
}

package com.flab.tabling.waiting.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.domain.Status;
import com.flab.tabling.waiting.domain.Waiting;

import jakarta.persistence.LockModeType;

/**
 * @Lock : 비관적 락, 낙관적 락과 관련하여 락 모드를 지정한다.
 * @Query : JPQL 작성, native=true면 native query 작성
 */

public interface WaitingRepository extends JpaRepository<Waiting, Long> {
	Optional<Waiting> findByMemberAndStoreAndStatus(Member member, Store store, Status status);

	Optional<Waiting> findFirstByStoreAndStatus(Store store, Status status);

	@Lock(LockModeType.PESSIMISTIC_WRITE)
	@Query("select w from Waiting w where w.status=:status and w.store=:store")
	Optional<Waiting> findFirstByStoreAndStatusByPessimisticLock(Store store, Status status);

	@Lock(LockModeType.PESSIMISTIC_READ)
	Integer countWithPessimisticLockByStoreAndStatus(Store store, Status status);

	@Override
	@Lock(LockModeType.PESSIMISTIC_WRITE)
	void delete(Waiting waiting);

	@Lock(LockModeType.PESSIMISTIC_WRITE)
	@Override
	<S extends Waiting> S save(S entity);
}

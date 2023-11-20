package com.flab.tabling.waiting.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;

import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;
import com.flab.tabling.waiting.domain.Status;
import com.flab.tabling.waiting.domain.Waiting;

import jakarta.persistence.LockModeType;

public interface WaitingRepository extends JpaRepository<Waiting, Long> {
	public Optional<Waiting> findByMemberAndStoreAndStatus(Member member, Store store, Status status);
	public Page<Waiting> findPageByStore(Store store, Pageable pageable);
	public Slice<Waiting> findSliceByStore(Store store, Pageable pageable);
	public Optional<Waiting> findFirstByStoreAndStatus(Store store, Status status);

	@Lock(LockModeType.PESSIMISTIC_WRITE)
	@Query("select w from Waiting w where w.status=:status and w.store=:store")
	public Optional<Waiting> findFirstByStoreAndStatusByPessimisticLock(Store store, Status status);
	@Lock(LockModeType.PESSIMISTIC_READ)
	public Integer countWithPessimisticLockByStoreAndStatus(Store store, Status status);

	@Override
	@Lock(LockModeType.PESSIMISTIC_WRITE)
	void delete(Waiting waiting);

	@Lock(LockModeType.PESSIMISTIC_WRITE)
	@Override
	<S extends Waiting> S save(S entity);
}

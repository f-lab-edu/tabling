package com.flab.tabling.user.repository;

import com.flab.tabling.user.domain.Member;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {
	Optional<Member> findByName(String name);
}

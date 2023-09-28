package com.flab.tabling.member.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flab.tabling.member.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
	Optional<Member> findByName(String name);
}

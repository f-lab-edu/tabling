package com.flab.tabling.store.domain;

import com.flab.tabling.member.domain.Member;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/*
@ManyToOne: 다대일 연관관계 지정
@JoinColumn: 연관관계의 주인, 조인 컬럼 설정
 */
@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Store {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id")
	private Member member;
	private String name;
	@Enumerated(value = EnumType.STRING)
	private Category category;
	private String description;
	private Integer maxWaitingCount;

	@Builder
	public Store(Member member, String name, Category category, String description, Integer maxWaitingCount) {
		this.member = member;
		this.name = name;
		this.category = category;
		this.description = description;
		this.maxWaitingCount = maxWaitingCount;
	}

	public void updateStore(String name, Category category, String description, Integer maxWaitingCount) {
		this.name = name;
		this.category = category;
		this.description = description;
		this.maxWaitingCount = maxWaitingCount;
	}
}

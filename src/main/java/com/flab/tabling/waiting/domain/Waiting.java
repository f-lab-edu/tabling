package com.flab.tabling.waiting.domain;

import java.time.LocalDateTime;

import com.flab.tabling.global.audit.BaseTime;
import com.flab.tabling.member.domain.Member;
import com.flab.tabling.store.domain.Store;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @PrePersist : 엔티티가 데이터베이스에 저장되기 직전에 호출되는 메소드
 */
@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Waiting extends BaseTime {
	private static final String CONJUNCTION = ":";
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "store_id")
	private Store store;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id")
	private Member member;
	private Integer headCount;
	private String uniqueKey;

	@Enumerated(value = EnumType.STRING)
	private Status status;

	@Builder
	public Waiting(Store store, Member member, Integer headCount, Status status) {
		this.store = store;
		this.member = member;
		this.headCount = headCount;
		this.status = status;
	}

	@PrePersist
	public void generateUniqueKey() {
		this.uniqueKey = store.getId().toString() + CONJUNCTION + member.getId() + CONJUNCTION + LocalDateTime.now().toLocalDate().toString();
	}

	public void accept() {
		this.status = Status.ENTRANCE;
	}
}

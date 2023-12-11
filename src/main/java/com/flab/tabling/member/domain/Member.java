package com.flab.tabling.member.domain;

import com.flab.tabling.global.audit.BaseTime;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @Entity: 엔티티 지정, 객체와 테이블 매핑
 * @NoArgsConstructor(access = AccessLevel.PROTECTED) : 기본 생성자를 protected 접근 제어자로 설정
 * 무분별한 기본 생성자 제한을 막기 위한 것.
 * @Id: 기본키 지정
 * @GeneratedValue(strategy = GenerationType.IDENTITY) : 대리 키 사용 방식,
 * IDENTITY: 기본 키 생성을 데이터베이스에 위임
 * @Builder : 빌더 패턴
 */

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Member extends BaseTime {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String email;
	private String password;
	@Enumerated(EnumType.STRING)
	private RoleType roleType;

	@Builder
	public Member(String name, String email, String password, RoleType roleType) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.roleType = roleType;
	}

	boolean isSeller() {
		return this.roleType.equals(RoleType.SELLER);
	}
}

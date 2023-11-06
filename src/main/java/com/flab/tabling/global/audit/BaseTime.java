package com.flab.tabling.global.audit;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;

/**
 * @Getter : getter 메소드를 public으로 선언
 * @MappedSuperclass : 하위 클래스에게 매핑되는 정보를 상위클래스에 지정
 * 상위클래스에서는 따로 분리되는 테이블을 갖지 않는다.
 * @EntityListeners : auditing을 여러 클래스에 추가하는 경우, @EntityListener를
 * 활용해서 코드를 한군데 모아둘 수 있다.
 * @CreatedDate : 필드를 갖고 있는 엔티티의 생성날짜 추가
 * @@LastModifiedDate : 필드를 갖고 있는 엔티티의 최근 수정날짜 추가
 * @CreatedBy : 필드를 갖고 있는 엔티티를 생성한 사람 이름 추가
 * @ModifiedBy : 필드를 갖고 있는 엔티티를 마지막으로 수정한 사람 이름 추가
 */
@Getter
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class BaseTime {
	@CreatedDate
	@Column(name = "created_at", updatable = false)
	private LocalDateTime createdAt;
	@LastModifiedDate
	@Column(name = "modified_at")
	private LocalDateTime modifiedAt;
	@Column(name = "created_by")
	@CreatedBy
	private String createdBy;
	@Column(name = "modified_by")
	@LastModifiedBy
	private String modifiedBy;
}

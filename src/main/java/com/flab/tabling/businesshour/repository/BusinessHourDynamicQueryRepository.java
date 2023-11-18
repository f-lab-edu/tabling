package com.flab.tabling.businesshour.repository;

import static com.flab.tabling.businesshour.domain.QBusinessHour.*;

import java.time.DayOfWeek;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.flab.tabling.businesshour.domain.BusinessHour;
import com.querydsl.core.QueryResults;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;

import jakarta.persistence.EntityManager;

@Repository
public class BusinessHourDynamicQueryRepository {
	private final JPAQueryFactory queryFactory;

	public BusinessHourDynamicQueryRepository(EntityManager entityManager) {
		this.queryFactory = new JPAQueryFactory(entityManager);
	}

	public Page<BusinessHour> findBusinessHours(Long storeId, DayOfWeek dayOfWeek, Pageable pageable) {
		QueryResults<BusinessHour> queriedResults = queryFactory.selectFrom(businessHour)
			.where(storeIdEq(storeId), dayOfWeekEq(dayOfWeek))
			.offset(pageable.getOffset())
			.limit(pageable.getPageSize())
			.orderBy(businessHour.dayOfWeek.asc())
			.fetchResults();

		List<BusinessHour> businessHourList = queriedResults.getResults();
		long totalCount = queriedResults.getTotal();
		return new PageImpl<>(businessHourList, pageable, totalCount);
	}

	private BooleanExpression storeIdEq(Long storeId) {
		return storeId != null ? businessHour.store.id.eq(storeId) : null;
	}

	private BooleanExpression dayOfWeekEq(DayOfWeek dayOfWeek) {
		return dayOfWeek != null ? businessHour.dayOfWeek.eq(dayOfWeek) : null;
	}
}

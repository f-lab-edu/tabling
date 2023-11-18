package com.flab.tabling.businesshour.repository;

import static org.assertj.core.api.Assertions.*;

import java.time.DayOfWeek;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.flab.tabling.FixtureFactory;
import com.flab.tabling.businesshour.BusinessHourFixture;
import com.flab.tabling.businesshour.domain.BusinessHour;

import jakarta.persistence.EntityManager;

@DataJpaTest
class BusinessHourDynamicQueryRepositoryTest {
	@Autowired
	EntityManager entityManager;
	BusinessHourDynamicQueryRepository dynamicQueryRepository;
	BusinessHourFixture businessHourFixture = FixtureFactory.businessHourFixture();

	@BeforeEach
	public void init() {
		dynamicQueryRepository = new BusinessHourDynamicQueryRepository(entityManager);
	}

	@Test
	@DisplayName("식당, 요일 조건을 모두 충족하는 운영 시간 조회에 성공한다.")
	void findSuccessWithAllConditions() {
		//given
		DayOfWeek requestDayOfWeek = businessHourFixture.getDayOfWeek();
		Pageable pageable = PageRequest.of(0, 10);

		//when
		Page<BusinessHour> businessHours = dynamicQueryRepository.findBusinessHours(2L, requestDayOfWeek, pageable);

		//then
		assertThat(businessHours.getContent().size()).isEqualTo(2);
	}

	@Test
	@DisplayName("식당 조건만 충족하는 운영 시간 조회에 성공한다.")
	void findSuccessWithOnlyStore() {
		//given
		Pageable pageable = PageRequest.of(0, 10);

		//when
		Page<BusinessHour> businessHours = dynamicQueryRepository.findBusinessHours(3L, null, pageable);

		//then
		assertThat(businessHours.getContent().size()).isEqualTo(2);
	}

	@Test
	@DisplayName("요일 조건만 충족하는 운영 시간 조회에 성공한다.")
	void findSuccessWithOnlyDayOfWeek() {
		//given
		DayOfWeek requestDayOfWeek = businessHourFixture.getDayOfWeek();
		Pageable pageable = PageRequest.of(0, 10);

		//when
		Page<BusinessHour> businessHours = dynamicQueryRepository.findBusinessHours(null, requestDayOfWeek, pageable);

		//then
		assertThat(businessHours.getContent().size()).isEqualTo(4);
	}

	@Test
	@DisplayName("조건이 없다면, 모든 운영 시간을 조회한다.")
	void findSuccessWithNoCondition() {
		//given
		Pageable pageable = PageRequest.of(0, 10);

		//when
		Page<BusinessHour> businessHours = dynamicQueryRepository.findBusinessHours(null, null, pageable);

		//then
		assertThat(businessHours.getContent().size()).isEqualTo(6);
	}
}

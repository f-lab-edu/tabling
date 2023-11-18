package com.flab.tabling.businesshour.repository;

import java.time.DayOfWeek;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.flab.tabling.businesshour.domain.BusinessHour;

public interface BusinessHourRepository extends JpaRepository<BusinessHour, Long> {

	@Query("select b from BusinessHour b where b.store.id = :storeId and b.dayOfWeek = :dayOfWeek")
	List<BusinessHour> findList(Long storeId, DayOfWeek dayOfWeek);
}

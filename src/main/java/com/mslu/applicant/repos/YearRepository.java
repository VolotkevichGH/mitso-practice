package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Year;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface YearRepository  extends JpaRepository<Year, Integer> {

    List<Year> findTop20ByOrderByNameDesc();
}

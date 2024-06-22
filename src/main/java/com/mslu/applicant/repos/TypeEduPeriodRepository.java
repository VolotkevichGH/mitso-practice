package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.TypeEducationContract;
import com.mslu.applicant.entity.references.TypeEducationPeriod;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeEduPeriodRepository extends JpaRepository<TypeEducationPeriod, Integer> {
    TypeEducationPeriod findTypeEducationPeriodById(Integer id);
}

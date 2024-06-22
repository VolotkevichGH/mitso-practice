package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.TypeEducation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeEduRepository extends JpaRepository<TypeEducation, Integer> {
}

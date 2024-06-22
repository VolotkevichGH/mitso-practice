package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.TypeEducationForm;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeEduFormRepository extends JpaRepository<TypeEducationForm, Integer> {
    TypeEducationForm findTypeEducationFormById(Integer id);
}

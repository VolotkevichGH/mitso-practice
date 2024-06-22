package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.TypeLocality;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeLocalityRepository extends JpaRepository<TypeLocality, Integer> {
    TypeLocality findTypeLocalityById(Integer id);
}

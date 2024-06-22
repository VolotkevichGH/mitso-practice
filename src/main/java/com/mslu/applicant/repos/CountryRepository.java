package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Country;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CountryRepository extends JpaRepository<Country, Integer> {
    List<Country> findByActiveTrueOrderByShortNameAsc();
    Country findCountryById(Integer id);
}

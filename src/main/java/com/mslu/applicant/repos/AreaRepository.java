package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Area;
import com.mslu.applicant.entity.references.Country;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AreaRepository extends JpaRepository<Area, Integer> {
    List<Area> findByCountry(Country country);
    Area findAreaById(Integer id);
}

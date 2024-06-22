package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Area;
import com.mslu.applicant.entity.references.District;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DistrictRepository extends JpaRepository<District, Integer> {
    List<District> findByAreaAndActiveTrue(Area area);
    District findDistrictById(Integer id);
}

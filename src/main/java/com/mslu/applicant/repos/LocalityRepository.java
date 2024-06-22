package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.*;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LocalityRepository extends JpaRepository<Locality, Integer> {
    List<Locality> findByAreaAndDistrictAndTypeLocalityOrderByNameAsc(Area area, Integer district, TypeLocality typeLocality);
    Locality findLocalityById(Integer id);
}

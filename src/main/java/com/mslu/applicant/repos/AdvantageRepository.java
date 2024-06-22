package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Advantage;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

public interface AdvantageRepository extends JpaRepository<Advantage, Integer> {
    List<Advantage> findByActiveTrue();
}

package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Award;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AwardRepository extends JpaRepository<Award, Integer> {
    List<Award> findByActiveTrue();
}

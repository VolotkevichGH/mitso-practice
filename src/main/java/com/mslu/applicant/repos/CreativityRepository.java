package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Creativity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CreativityRepository extends JpaRepository<Creativity, Integer> {
    List<Creativity> findByActiveTrue();
}
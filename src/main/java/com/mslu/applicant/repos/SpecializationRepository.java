package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Faculty;
import com.mslu.applicant.entity.references.Specialization;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SpecializationRepository extends JpaRepository<Specialization, Integer>  {
}

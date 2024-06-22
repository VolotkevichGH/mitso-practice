package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.MaritalStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MaritalRepository extends JpaRepository<MaritalStatus, Integer> {
}

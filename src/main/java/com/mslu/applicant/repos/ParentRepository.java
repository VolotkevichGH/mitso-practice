package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Parent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ParentRepository extends JpaRepository<Parent, Integer> {
}

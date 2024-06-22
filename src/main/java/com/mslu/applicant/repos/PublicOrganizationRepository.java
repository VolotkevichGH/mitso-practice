package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.PublicOrganization;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PublicOrganizationRepository extends JpaRepository<PublicOrganization, Integer> {
    List<PublicOrganization> findByActiveTrue();
}

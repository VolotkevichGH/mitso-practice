package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.TypeCompetition;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeCompetitionRepository extends JpaRepository<TypeCompetition, Integer> {
    TypeCompetition findTypeCompetitionById(Integer id);
}

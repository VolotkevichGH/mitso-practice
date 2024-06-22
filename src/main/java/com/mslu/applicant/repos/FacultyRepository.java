package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Country;
import com.mslu.applicant.entity.references.Faculty;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FacultyRepository extends JpaRepository<Faculty, Integer> {
    List<Faculty> findByActiveTrue();
    Faculty findFacultyById(Integer id);
}

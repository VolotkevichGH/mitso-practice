package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.SportTitle;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SportTitleRepository extends JpaRepository<SportTitle, Integer> {
    List<SportTitle> findByActiveTrue();
}

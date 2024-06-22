package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.Area;
import com.mslu.applicant.entity.references.Country;
import com.mslu.applicant.entity.references.Language;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LanguageRepository extends JpaRepository<Language, Integer> {
    List<Language> findByStateLanguageTrue();
    List<Language> findByForeignLanguageTrue();
}

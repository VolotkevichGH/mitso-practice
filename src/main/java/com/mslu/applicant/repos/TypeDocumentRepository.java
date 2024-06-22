package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.TypeDocument;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeDocumentRepository extends JpaRepository<TypeDocument, Integer> {
    TypeDocument findTypeDocumentById(Integer id);
}

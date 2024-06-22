package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.TypeEducationContract;
import com.mslu.applicant.entity.references.TypeEducationForm;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeEduContractRepository extends JpaRepository<TypeEducationContract, Integer> {
    TypeEducationContract findTypeEducationContractById(Integer id);
}

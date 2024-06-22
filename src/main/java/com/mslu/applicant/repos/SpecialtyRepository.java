package com.mslu.applicant.repos;

import com.mslu.applicant.entity.references.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SpecialtyRepository extends JpaRepository<Specialty, Integer> {

    @Query("select distinct spec.typeEducationForm from Specialty spec where spec.faculty = ?1 and spec.active=true")
    List<TypeEducationForm> findEduFormsByFacultyAndActiveTrue(Faculty faculty);

    @Query("select distinct spec.typeEducationContract from Specialty spec where spec.faculty = ?1 and spec.typeEducationForm = ?2 and spec.active=true")
    List<TypeEducationContract> findEduContractsByFacultyAndEduFormAndActiveTrue(Faculty faculty, TypeEducationForm eduForm);

    @Query("select distinct spec.typeEducationPeriod from Specialty spec where spec.faculty = ?1 and spec.typeEducationForm = ?2 and spec.typeEducationContract = ?3 and spec.active=true")
    List<TypeEducationPeriod> findEduPeriodsByFacultyAndEduFormAndEduContractAndActiveTrue(Faculty faculty, TypeEducationForm eduForm, TypeEducationContract eduContract);

    List<Specialty> findAllByFacultyAndTypeEducationFormAndTypeEducationContractAndTypeEducationPeriodAndActiveTrue(Faculty faculty, TypeEducationForm form, TypeEducationContract contract, TypeEducationPeriod period);
}

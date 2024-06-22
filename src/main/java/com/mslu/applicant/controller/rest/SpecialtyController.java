package com.mslu.applicant.controller.rest;

import com.mslu.applicant.entity.User;
import com.mslu.applicant.entity.references.Specialty;
import com.mslu.applicant.entity.references.TypeEducationContract;
import com.mslu.applicant.entity.references.TypeEducationForm;
import com.mslu.applicant.entity.references.TypeEducationPeriod;
import com.mslu.applicant.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class SpecialtyController {
    @Autowired
    private FacultyRepository facultyRepository;

    @Autowired
    private SpecialtyRepository specialtyRepository;

    @Autowired
    private TypeEduFormRepository typeEduFormRepository;

    @Autowired
    private TypeEduContractRepository typeEduContractRepository;

    @Autowired
    private TypeEduPeriodRepository typeEduPeriodRepository;

    @GetMapping("/eduForm")
    public Map<String,String> getEduForm(@AuthenticationPrincipal User user, @RequestParam(value = "faculty") String idFaculty) {
        Iterable<TypeEducationForm> typeEduForms = specialtyRepository.findEduFormsByFacultyAndActiveTrue(facultyRepository.findFacultyById(Integer.parseInt(idFaculty)));

        Map<String,String> eduFormsResult = new HashMap<String, String>();

        eduFormsResult.put("","Форма обучения");

        for (TypeEducationForm form: typeEduForms) {
            eduFormsResult.put(form.getId().toString(),form.getFullName());
        }


        return eduFormsResult;
    }

    @GetMapping("/eduContract")
    public Map<String,String> getEduContract(@AuthenticationPrincipal User user,
                                             @RequestParam(value = "faculty") String idFaculty,
                                             @RequestParam(value = "eduForm", defaultValue = "0") String idForm) {
        Iterable<TypeEducationContract> typeEduContracts = specialtyRepository.findEduContractsByFacultyAndEduFormAndActiveTrue(
                facultyRepository.findFacultyById(Integer.parseInt(idFaculty)),
                typeEduFormRepository.findTypeEducationFormById(Integer.parseInt(idForm)));

        Map<String,String> eduContractsResult = new HashMap<String, String>();

        eduContractsResult.put("","Форма договора на обучение");

        for (TypeEducationContract contract: typeEduContracts) {
            eduContractsResult.put(contract.getId().toString(),contract.getFullName());
        }

        return eduContractsResult;
    }

    @GetMapping("/eduPeriod")
    public Map<String,String> getEduContract(@AuthenticationPrincipal User user,
                                             @RequestParam(value = "faculty") String idFaculty,
                                             @RequestParam(value = "eduForm", defaultValue = "0") String idForm,
                                             @RequestParam(value = "eduContract", defaultValue = "0") String idContract) {
        Iterable<TypeEducationPeriod> typeEduPeriods = specialtyRepository.findEduPeriodsByFacultyAndEduFormAndEduContractAndActiveTrue(
                facultyRepository.findFacultyById(Integer.parseInt(idFaculty)),
                typeEduFormRepository.findTypeEducationFormById(Integer.parseInt(idForm)),
                typeEduContractRepository.findTypeEducationContractById(Integer.parseInt(idContract)));

        Map<String,String> typeEduPeriodsResult = new HashMap<String, String>();

        typeEduPeriodsResult.put("","Срок обучения");

        for (TypeEducationPeriod period: typeEduPeriods) {
            typeEduPeriodsResult.put(period.getId().toString(),period.getFullName());
        }

        return typeEduPeriodsResult;
    }

    @GetMapping("/specialty")
    public Map<String,String> getEduPeriod(@AuthenticationPrincipal User user,
                                           @RequestParam(value = "faculty") String idFaculty,
                                           @RequestParam(value = "eduForm", defaultValue = "0") String idForm,
                                           @RequestParam(value = "eduContract", defaultValue = "0") String idContract,
                                           @RequestParam(value = "eduPeriod", defaultValue = "0") String idPeriod) {
        List<Specialty> specialties = specialtyRepository.findAllByFacultyAndTypeEducationFormAndTypeEducationContractAndTypeEducationPeriodAndActiveTrue(
                facultyRepository.findFacultyById(Integer.parseInt(idFaculty)),
                typeEduFormRepository.findTypeEducationFormById(Integer.parseInt(idForm)),
                typeEduContractRepository.findTypeEducationContractById(Integer.parseInt(idContract)),
                typeEduPeriodRepository.findTypeEducationPeriodById(Integer.parseInt(idPeriod)));

        Map<String,String> specialtiesResult = new HashMap<String, String>();

        specialtiesResult.put("","Название специальности");

        for (Specialty specialty: specialties) {
            specialtiesResult.put(specialty.getId().toString(),specialty.getFullName());
        }

        return specialtiesResult;
    }

}

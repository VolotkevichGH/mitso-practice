package com.mslu.applicant.entity.references;

import jakarta.persistence.*;

@Entity
public class Specialty {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    @OneToOne
    @JoinColumn(name = "faculty", referencedColumnName = "id")
    private Faculty faculty;

    @OneToOne
    @JoinColumn(name = "typeEduForm", referencedColumnName = "id")
    private TypeEducationForm typeEducationForm;

    @OneToOne
    @JoinColumn(name = "typeEduPeriod", referencedColumnName = "id")
    private TypeEducationPeriod typeEducationPeriod;

    @OneToOne
    @JoinColumn(name = "typeEduContract", referencedColumnName = "id")
    private TypeEducationContract typeEducationContract;

    private String fullName;

    private String officialName;

    private String shortName;

    private Integer course;

    private String specialtyCode;

    private String specialtyName;

    private String qualification;

    private String programGenitive;

    private String lengthOfStudy;

    private String tuitionFees;


    private boolean active;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public TypeEducationForm getTypeEducationForm() {
        return typeEducationForm;
    }

    public void setTypeEducationForm(TypeEducationForm typeEducationForm) {
        this.typeEducationForm = typeEducationForm;
    }

    public TypeEducationPeriod getTypeEducationPeriod() {
        return typeEducationPeriod;
    }

    public void setTypeEducationPeriod(TypeEducationPeriod typeEducationPeriod) {
        this.typeEducationPeriod = typeEducationPeriod;
    }

    public TypeEducationContract getTypeEducationContract() {
        return typeEducationContract;
    }

    public void setTypeEducationContract(TypeEducationContract typeEducationContract) {
        this.typeEducationContract = typeEducationContract;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getOfficialName() {
        return officialName;
    }

    public void setOfficialName(String officialName) {
        this.officialName = officialName;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public Integer getCourse() {
        return course;
    }

    public void setCourse(Integer course) {
        this.course = course;
    }

    public String getSpecialtyCode() {
        return specialtyCode;
    }

    public void setSpecialtyCode(String specialtyCode) {
        this.specialtyCode = specialtyCode;
    }

    public String getSpecialtyName() {
        return specialtyName;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getProgramGenitive() {
        return programGenitive;
    }

    public void setProgramGenitive(String programGenitive) {
        this.programGenitive = programGenitive;
    }

    public String getLengthOfStudy() {
        return lengthOfStudy;
    }

    public void setLengthOfStudy(String lengthOfStudy) {
        this.lengthOfStudy = lengthOfStudy;
    }

    public String getTuitionFees() {
        return tuitionFees;
    }

    public void setTuitionFees(String tuitionFees) {
        this.tuitionFees = tuitionFees;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}

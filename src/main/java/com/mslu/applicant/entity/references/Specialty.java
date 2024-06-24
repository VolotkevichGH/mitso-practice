package com.mslu.applicant.entity.references;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
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

}

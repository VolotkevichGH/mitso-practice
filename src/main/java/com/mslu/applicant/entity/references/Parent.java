package com.mslu.applicant.entity.references;

import com.mslu.applicant.entity.Profile;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class Parent {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String lastName;

    private String firstName;

    private String middleName;

    private String phone;

    private String workPlace;

    private String position;

    private String address;

    private boolean mother;

    private boolean father;

    private boolean legalRepresentative;

}

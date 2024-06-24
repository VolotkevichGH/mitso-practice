package com.mslu.applicant.entity.references;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class TypeEducationForm {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String fullName;

    private String shortName;

    private String fullNameGenitive;

}

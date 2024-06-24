package com.mslu.applicant.entity.references;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class Advantage {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String shortName;

    private String fullName;

    private String letterCode;

    private String needDocuments;

    private boolean active;

}

package com.mslu.applicant.entity.references;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class MaritalStatus {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String status;

    private String statusForMan;

    private String statusForWoman;

}

package com.mslu.applicant.entity.references;

import jakarta.persistence.*;

@Entity
public class TypeEducationForm {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String fullName;

    private String shortName;

    private String fullNameGenitive;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getFullNameGenitive() {
        return fullNameGenitive;
    }

    public void setFullNameGenitive(String fullNameGenitive) {
        this.fullNameGenitive = fullNameGenitive;
    }
}

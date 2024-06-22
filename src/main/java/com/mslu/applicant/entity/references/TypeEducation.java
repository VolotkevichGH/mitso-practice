package com.mslu.applicant.entity.references;

import jakarta.persistence.*;

@Entity
public class TypeEducation {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String name;

    private String typeDocumentGraduate;

    private boolean hasSpecialty;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTypeDocumentGraduate() {
        return typeDocumentGraduate;
    }

    public void setTypeDocumentGraduate(String typeDocumentGraduate) {
        this.typeDocumentGraduate = typeDocumentGraduate;
    }

    public boolean isHasSpecialty() {
        return hasSpecialty;
    }

    public void setHasSpecialty(boolean hasSpecialty) {
        this.hasSpecialty = hasSpecialty;
    }
}

package com.mslu.applicant.entity.references;

import jakarta.persistence.*;
@Entity
public class Country {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private Integer code;

    private String shortName;

    private String fullName;

    private String letterCode1;

    private String letterCode2;

    private boolean active;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getLetterCode1() {
        return letterCode1;
    }

    public void setLetterCode1(String letterCode1) {
        this.letterCode1 = letterCode1;
    }

    public String getLetterCode2() {
        return letterCode2;
    }

    public void setLetterCode2(String letterCode2) {
        this.letterCode2 = letterCode2;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}

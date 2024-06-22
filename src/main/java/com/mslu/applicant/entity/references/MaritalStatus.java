package com.mslu.applicant.entity.references;

import jakarta.persistence.*;

@Entity
public class MaritalStatus {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String status;

    private String statusForMan;

    private String statusForWoman;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatusForMan() {
        return statusForMan;
    }

    public void setStatusForMan(String statusForMan) {
        this.statusForMan = statusForMan;
    }

    public String getStatusForWoman() {
        return statusForWoman;
    }

    public void setStatusForWoman(String statusForWoman) {
        this.statusForWoman = statusForWoman;
    }
}

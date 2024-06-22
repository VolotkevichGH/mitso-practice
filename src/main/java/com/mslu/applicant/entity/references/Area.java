package com.mslu.applicant.entity.references;

import jakarta.persistence.*;

@Entity
public class Area {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    @ManyToOne (cascade = CascadeType.ALL)
    @JoinColumn(name = "country")
    private Country country;

    private String name;

    private boolean hasLocality;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isHasLocality() {
        return hasLocality;
    }

    public void setHasLocality(boolean hasLocality) {
        this.hasLocality = hasLocality;
    }
}

package com.mslu.applicant.entity.references;

import com.mslu.applicant.repos.DistrictRepository;
import org.springframework.beans.factory.annotation.Autowired;

import jakarta.persistence.*;

@Entity
public class Locality {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private Integer district;

    @Autowired
    @Transient
    private DistrictRepository districtRepository;

    private String soato;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "type")
    private TypeLocality typeLocality;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "area")
    private Area area;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "country")
    private Country country;


    private String name;

    private String sovet;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDistrict() {
        return district;
    }

    public void setDistrict(Integer district) {
        this.district = district;
    }

    public String getSoato() {
        return soato;
    }

    public void setSoato(String soato) {
        this.soato = soato;
    }

    public TypeLocality getTypeLocality() {
        return typeLocality;
    }

    public void setTypeLocality(TypeLocality typeLocality) {
        this.typeLocality = typeLocality;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSovet() {
        return sovet;
    }

    public void setSovet(String sovet) {
        this.sovet = sovet;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getDistrictName(){
        if(this.district != 0)
            return districtRepository.findDistrictById(this.district).getName();
        else
            return "";
    }
}

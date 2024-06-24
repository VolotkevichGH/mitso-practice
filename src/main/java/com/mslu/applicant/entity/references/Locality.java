package com.mslu.applicant.entity.references;

import com.mslu.applicant.repos.DistrictRepository;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;

import jakarta.persistence.*;

@Entity
@Getter
@Setter
public class Locality {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private Integer district;

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


    public String getDistrictName(){
        if(this.district != 0)
            return districtRepository.findDistrictById(this.district).getName();
        else
            return "";
    }
}

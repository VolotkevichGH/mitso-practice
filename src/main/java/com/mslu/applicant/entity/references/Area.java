package com.mslu.applicant.entity.references;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
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

}

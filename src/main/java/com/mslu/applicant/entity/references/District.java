package com.mslu.applicant.entity.references;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class District {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private Integer code;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "area")
    private Area area;

    private String name;

    private boolean active;

}

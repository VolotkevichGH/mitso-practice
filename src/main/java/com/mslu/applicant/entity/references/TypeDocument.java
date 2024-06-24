package com.mslu.applicant.entity.references;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class TypeDocument {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    private String type;



    //public TypeDocument(String type) {
      //  this.type = type;
    //}

}

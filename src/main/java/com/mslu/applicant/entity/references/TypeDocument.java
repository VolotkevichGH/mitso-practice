package com.mslu.applicant.entity.references;


import jakarta.persistence.*;

@Entity
public class TypeDocument {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    private String type;



    //public TypeDocument(String type) {
      //  this.type = type;
    //}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}

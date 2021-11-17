package com.example.orderApp.entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity (name = "dc_hospital")
public class Hospital {
    @Id
    @SequenceGenerator(
            name = "hospital_sequence",
            sequenceName = "hospital_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "hospital_sequence"
    )
    private int hospitalId;
    private String hospitalName;

    @OneToMany(
            mappedBy = "hospital",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    List<Employee> employees = new ArrayList<>();

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

//    @OneToMany(
//            mappedBy = "hospital",
//            cascade = CascadeType.ALL,
//            orphanRemoval = true
//    )
//    List<OrderType> orderTypes = new ArrayList<>();

//    public void setOrderTypes(List<OrderType> orderTypes) {
//        this.orderTypes = orderTypes;
//    }


    public Hospital() {
    }

    public Hospital(String hospital_name) {
        this.hospitalName = hospital_name;
    }

    public int getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(int hospitalId) {
        this.hospitalId = hospitalId;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    @Override
    public String toString() {
        return "Hospital{" +
                "hospital_id=" + hospitalId +
                ", hospital_name='" + hospitalName + '\'' +
                '}';
    }
}

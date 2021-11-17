package com.example.orderApp.entities;

import com.example.orderApp.entities.Hospital;
import com.example.orderApp.entities.Order;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity (name = "dc_type")
public class OrderType {
    @Id
    @SequenceGenerator(
            name = "type_sequence",
            sequenceName = "type_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "type_sequence"
    )
    private int type_id;
    private String type_name;
    private String type_code;
    private int duration;

//    @OneToMany(mappedBy = "orderType",
//            cascade = CascadeType.ALL,
//            orphanRemoval = true)
//    List<Order> orders = new ArrayList<>();

//    public void setOrders(List<Order> orders) {
//        this.orders = orders;
//    }

    @ManyToOne
    @JoinColumn(name = "hospital_id")
    private Hospital hospital;


    public OrderType() {
    }

    public OrderType(String type_name, String type_code, int duration , Hospital hospital) {
        this.type_name = type_name;
        this.type_code = type_code;
        this.duration = duration;
        this.hospital = hospital;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getType_code() {
        return type_code;
    }

    public void setType_code(String type_code) {
        this.type_code = type_code;
    }

//    public List<Order> getOrders() {
//        return orders;
//    }

    public Hospital getHospital() {
        return hospital;
    }

    public void setHospital(Hospital hospital) {
        this.hospital = hospital;
    }

    @Override
    public String toString() {
        return "OrderType{" +
                "type_id=" + type_id +
                ", type_name='" + type_name + '\'' +
                ", duration=" + duration +
                '}';
    }
}

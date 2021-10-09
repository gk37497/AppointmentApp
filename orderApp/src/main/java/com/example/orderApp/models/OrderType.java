package com.example.orderApp.models;

import javax.persistence.*;

@Entity (name = "type")
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
    private int tId;
    private String typeName;
    private int duration;

    public OrderType() {
    }

    public OrderType(int tId, String typeName, int duration) {
        this.tId = tId;
        this.typeName = typeName;
        this.duration = duration;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "OrderType{" +
                "tId=" + tId +
                ", typeName='" + typeName + '\'' +
                ", duration=" + duration +
                '}';
    }
}

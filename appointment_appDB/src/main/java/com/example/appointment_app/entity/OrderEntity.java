package com.example.appointment_app.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDate;

@Entity
public class OrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int id;
    String oID;
    String dID;
    String consumerName;
    int consumerPhoneNumber;
    LocalDate startDate;
    LocalDate endDate;
    String type;
    int isDone;

    public OrderEntity() { }

    public int getConsumerPhoneNumber() { return consumerPhoneNumber; }

    public void setConsumerPhoneNumber(int consumerPhoneNumber) { this.consumerPhoneNumber = consumerPhoneNumber; }

    public String getoID() { return oID; }

    public void setoID(String oID) { this.oID = oID; }

    public String getdID() { return dID; }

    public void setdID(String dID) { this.dID = dID; }

    public String getConsumerName() { return consumerName; }

    public void setConsumerName(String consumerName) { this.consumerName = consumerName; }

    public LocalDate getStartDate() { return startDate; }

    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }

    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public String getType() { return type; }

    public void setType(String type) { this.type = type; }

    public int getIsDone() { return isDone; }

    public void setIsDone(int isDone) { this.isDone = isDone; }
}

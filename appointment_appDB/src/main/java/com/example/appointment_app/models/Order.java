package com.example.appointment_app.models;

import java.time.LocalDate;

public class Order {
    public String oID;
    public String dID;
    public String consumerName;
    public int consumerPhoneNumber;
    public LocalDate startDate;
    public LocalDate endDate;
    public String typeID;
    public int isDone;

    public Order(String oID, String dID, String consumerName, int consumerPhoneNumber, LocalDate startDate, LocalDate endDate, String typeID, int isDone) {
        this.oID = oID;
        this.dID = dID;
        this.consumerName = consumerName;
        this.consumerPhoneNumber = consumerPhoneNumber;
        this.startDate = startDate;
        this.endDate = endDate;
        this.typeID = typeID;
        this.isDone = isDone;
    }

    public String getoID() {
        return oID;
    }

    public void setoID(String oID) {
        this.oID = oID;
    }

    public String getdID() {
        return dID;
    }

    public void setdID(String dID) {
        this.dID = dID;
    }

    public String getConsumerName() {
        return consumerName;
    }

    public void setConsumerName(String consumerName) {
        this.consumerName = consumerName;
    }

    public int getConsumerPhoneNumber() {
        return consumerPhoneNumber;
    }

    public void setConsumerPhoneNumber(int consumerPhoneNumber) {
        this.consumerPhoneNumber = consumerPhoneNumber;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getTypeID() {
        return typeID;
    }

    public void setTypeID(String typeID) {
        this.typeID = typeID;
    }

    public int getIsDone() {
        return isDone;
    }

    public void setIsDone(int isDone) {
        this.isDone = isDone;
    }
}

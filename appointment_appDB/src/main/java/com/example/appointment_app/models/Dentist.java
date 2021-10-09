package com.example.appointment_app.models;

public class Dentist {
    public String dId;
    public String firstName;
    public String lastName;

    public Dentist(String dId, String firstName, String lastName) {
        this.dId = dId;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Dentist() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getdId() {
        return dId;
    }

    public void setdId(String dId) {
        this.dId = dId;
    }
}

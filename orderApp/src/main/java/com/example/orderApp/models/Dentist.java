package com.example.orderApp.models;


import javax.persistence.*;

@Entity(name = "dentists")
public class Dentist {
    @Id
    @SequenceGenerator(
            name = "dentist_sequence",
            sequenceName = "dentist_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "dentist_sequence"
    )
    private int dId;
    private int userID;
    private String firstName;
    private String lastName;

    public Dentist() {

    }

    public int getdId() {
        return dId;
    }

    public void setdId(int dId) {
        this.dId = dId;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    public Dentist(int dId, int userID, String firstName, String lastName) {
        this.dId = dId;
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return "Dentist{" +
                "dId=" + dId +
                ", userID=" + userID +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }
}

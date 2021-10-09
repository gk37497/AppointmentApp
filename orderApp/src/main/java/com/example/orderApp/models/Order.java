package com.example.orderApp.models;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @SequenceGenerator(
            name = "order_sequence",
            sequenceName = "order_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "order_sequence"
    )
    private int oId;
    private int dId;
    private int tId;
    private String consumerName;

    @Column(name = "start_date", columnDefinition = "TIMESTAMP")
    private LocalDateTime startDate;

    @Column(name = "end_date", columnDefinition = "TIMESTAMP")
    private LocalDateTime endDate;
    private int isDone;

    public Order() {
    }

    public Order(int oId, int dId, int tId, String consumerName, LocalDateTime startDate, LocalDateTime endDate, int isDone) {
        this.oId = oId;
        this.dId = dId;
        this.tId = tId;
        this.consumerName = consumerName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isDone = isDone;
    }

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public int getdId() {
        return dId;
    }

    public void setdId(int dId) {
        this.dId = dId;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String getConsumerName() {
        return consumerName;
    }

    public void setConsumerName(String consumerName) {
        this.consumerName = consumerName;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public int getIsDone() {
        return isDone;
    }

    public void setIsDone(int isDone) {
        this.isDone = isDone;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oId=" + oId +
                ", dId=" + dId +
                ", tId=" + tId +
                ", consumerName='" + consumerName + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", isDone=" + isDone +
                '}';
    }
}

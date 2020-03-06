package com.atxiaoniu.bean;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import java.sql.Date;


@Repository
public class Order {

    private Integer id;
    private String userName;
    private String checkCode;
    private int status;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private Double money;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCheckCode() {
        return checkCode;
    }

    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Order() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Order(Integer id, String userName, String checkCode, int status, Date date, Double money) {
        this.id = id;
        this.userName = userName;
        this.checkCode = checkCode;
        this.status = status;
        this.date = date;
        this.money = money;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", checkCode='" + checkCode + '\'' +
                ", status=" + status +
                ", date=" + date +
                ", money=" + money +
                '}';
    }
}

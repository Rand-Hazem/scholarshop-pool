package com.iteam.scholarships.entity;

import javax.persistence.*;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "reset_password_token")
public class ResetPasswordToken {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String token;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date expiryDate;

    @OneToOne(optional = false)
    private User user;

    public ResetPasswordToken() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 1); // expire after one day
        setExpiryDate(calendar.getTime());

        this.token = UUID.randomUUID().toString();
    }

    public ResetPasswordToken(User user) {
        this();
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public boolean isExpired(){
        return new Date().after(expiryDate);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}

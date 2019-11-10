package com.iteam.scholarships.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "verification_token")
public class VerificationToken {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date createdDate;

    @OneToOne(optional = false, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false)
    private String token;

    public VerificationToken(){
        createdDate = new Date();
        token = UUID.randomUUID().toString();

    }

    public VerificationToken(User user) {
        this();
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}



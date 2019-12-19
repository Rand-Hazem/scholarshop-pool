package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.entity.User;

import javax.persistence.*;

@Entity
public class SavedScholarship {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "scholarship_id", insertable = false, updatable = false)
    private int scholarshipId;

    @Column(name = "user_id", insertable = false, updatable = false)
    private int userId;

    @ManyToOne(optional = false) @JoinColumn(name = "scholarship_id")
    private Scholarship scholarship;

    @ManyToOne(optional = false) @JoinColumn(name = "user_id")
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getScholarshipId() {
        return scholarshipId;
    }

    public void setScholarshipId(int scholarshipId) {
        this.scholarshipId = scholarshipId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

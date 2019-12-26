package com.iteam.scholarships.entity;

import javax.persistence.*;

@Entity
public class Student{
    @Id
    private Integer id;

    @MapsId @OneToOne(fetch = FetchType.LAZY, optional = false)
    private User user;

    @ManyToOne(cascade = CascadeType.PERSIST) @JoinColumn(name = "university_id")
    private University university;

    public Student() {
    }

    public Student(int id) {
        this.id = id;
    }

    public Student(User user) {
        this.user = user;
    }

    public Student(User user, University university) {
        this.user = user;
        this.university = university;
    }

    public int getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public University getUniversity() {
        return university;
    }

    public void setUniversity(University university) {
        this.university = university;
    }

}

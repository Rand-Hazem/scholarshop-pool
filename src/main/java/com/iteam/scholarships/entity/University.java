package com.iteam.scholarships.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class University {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String location;

    @OneToMany(mappedBy = "university", fetch = FetchType.LAZY)
    @Column(insertable = false, updatable = false)
    private List<Student> students;

    public University() {
        students = new ArrayList<>();
    }

    public University(String name, String location) {
        this();
        this.name = name;
        this.location = location;
    }

    public University(String name, String location, ArrayList<Student> students) {
        this.name = name;
        this.location = location;
        this.students = students;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }

    @Override
    public String toString() {
        return "\nUniversity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                '}';
    }
}
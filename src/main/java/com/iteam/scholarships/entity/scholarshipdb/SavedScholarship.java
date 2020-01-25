package com.iteam.scholarships.entity.scholarshipdb;

import javax.persistence.*;

@Entity
public class SavedScholarship {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "scholarship_id", insertable = false, updatable = false)
    private int scholarshipId;

    @Column(name = "student_id")
    private int studentId;

    @ManyToOne(optional = false) @JoinColumn(name = "scholarship_id")
    private Scholarship scholarship;

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

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }
}

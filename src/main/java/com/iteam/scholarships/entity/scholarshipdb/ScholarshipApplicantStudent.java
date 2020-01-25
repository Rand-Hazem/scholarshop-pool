package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.entity.Student;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ScholarshipApplicantStudent {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false) @Temporal(TemporalType.DATE)
    private Date date; // apply date

    @Column(name = "scholarship_id", nullable = false, insertable = false, updatable = false)
    private int scholarshipId;

    @Column(nullable = false)
    private int studentId;

    @ManyToOne(optional = false) @JoinColumn(name = "scholarship_id")
    private Scholarship scholarship;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

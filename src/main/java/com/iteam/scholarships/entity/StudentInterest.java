package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.ScholarshipE;
import org.springframework.lang.NonNull;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class StudentInterest {
    @Id @Column(name = "student_id")
    private int studentId;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.Type scholarshipType;

    @Column(nullable = false)
    private String country;

    @Column(nullable = false)
    private String major;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.Degree degree;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.Language language;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.FundType fundType;


    public StudentInterest() {
    }

    public StudentInterest(int studentId) {
        this.studentId = studentId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    @NotNull
    public ScholarshipE.Type getScholarshipType() {
        return scholarshipType;
    }

    public void setScholarshipType(ScholarshipE.Type scholarshipType) {
        this.scholarshipType = scholarshipType;
    }

    @NotBlank @Size(min = 2, max = 2)
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @NotBlank
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @NotNull
    public ScholarshipE.Degree getDegree() {
        return degree;
    }

    public void setDegree(ScholarshipE.Degree degree) {
        this.degree = degree;
    }

    @NotNull
    public ScholarshipE.Language getLanguage() {
        return language;
    }

    public void setLanguage(ScholarshipE.Language language) {
        this.language = language;
    }

    @NonNull
    public ScholarshipE.FundType getFundType() {
        return fundType;
    }

    public void setFundType(ScholarshipE.FundType fundType) {
        this.fundType = fundType;
    }

}

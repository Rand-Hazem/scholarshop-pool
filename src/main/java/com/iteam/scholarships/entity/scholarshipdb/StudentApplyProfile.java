package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.entity.Student;
import com.iteam.scholarships.enums.ScholarshipE;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Table()
public class StudentApplyProfile {

    @Id @Column(name = "student_id")
    private int id;

    @Column(nullable = false)
    private int age;

    @Column(nullable = false)
    private String major;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.Degree degree;

    @Column(nullable = false)
    private String nationality;

    @Column(nullable = false)
    private String resident;

    @Column(nullable = false)
    private int completeYearOfStudy;

    @Column(nullable = false)
    private double universityGpa;

    @Column(nullable = false)
    private double schoolGpa;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.EnglishLevel englishLevel;

    @Column(nullable = false)
    private String driveLink;

    @ElementCollection(fetch = FetchType.EAGER) @CollectionTable(joinColumns = @JoinColumn(name = "id"))
    private List<String> certificates;

    public StudentApplyProfile() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Min(15)
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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

    @Min(1) @Max(10)
    public int getCompleteYearOfStudy() {
        return completeYearOfStudy;
    }

    public void setCompleteYearOfStudy(int completeYearOfStudy) {
        this.completeYearOfStudy = completeYearOfStudy;
    }

    @Min(1) @Max(4)
    public double getUniversityGpa() {
        return universityGpa;
    }

    public void setUniversityGpa(double universityGpa) {
        this.universityGpa = universityGpa;
    }

    @Min(1) @Max(4)
    public double getSchoolGpa() {
        return schoolGpa;
    }

    public void setSchoolGpa(double schoolGpa) {
        this.schoolGpa = schoolGpa;
    }

    @NotNull
    public ScholarshipE.EnglishLevel getEnglishLevel() {
        return englishLevel;
    }

    public void setEnglishLevel(ScholarshipE.EnglishLevel englishLevel) {
        this.englishLevel = englishLevel;
    }

    @NotNull @URL
    public String getDriveLink() {
        return driveLink;
    }

    public void setDriveLink(String driveLink) {
        this.driveLink = driveLink;
    }

    public List<String> getCertificates() {
        return certificates;
    }

    public void setCertificates(List<String> certificates) {
        this.certificates = certificates;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getResident() {
        return resident;
    }

    public void setResident(String resident) {
        this.resident = resident;
    }
}



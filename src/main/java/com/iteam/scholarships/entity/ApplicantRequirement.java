package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.Scholarshipi;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@MappedSuperclass
public class ApplicantRequirement {

    @Id
    private int id;

    @Column(nullable = false)
    @ElementCollection @CollectionTable(joinColumns = @JoinColumn(name = "scholarship_id"))
    private List<String> nationality;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private Scholarshipi.ApplicantResidentIn residenceIn;

    @Column(nullable = false)
    @ElementCollection @CollectionTable(joinColumns = @JoinColumn(name = "scholarship_id"))
    private List<String> major;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private Scholarshipi.Gender gender;

    @Column(nullable = false)
    private int minAge;

    @Column(nullable = false)
    private int maxAge;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private Scholarshipi.ApplicantDegreeRequired minDegree;

    @Column(nullable = false)
    private double minSchoolGPA;

    @Column(nullable = false)
    private double minUnivGPA;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private Scholarshipi.EnglishLevel englishLevel;


    @MapsId
    @OneToOne(fetch = FetchType.LAZY)
    private Scholarship scholarship;




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotNull @NotEmpty
    public List<String> getNationality() {
        return nationality;
    }

    public void setNationality(List<String> nationality) {
        this.nationality = nationality;
    }

    @NotNull @NotEmpty
    public Scholarshipi.ApplicantResidentIn getResidenceIn() {
        return residenceIn;
    }

    public void setResidenceIn(Scholarshipi.ApplicantResidentIn residenceIn) {
        this.residenceIn = residenceIn;
    }

    public List<String> getMajor() {
        return major;
    }

    public void setMajor(List<String> major) {
        this.major = major;
    }

    @NotNull
    public Scholarshipi.Gender getGender() {
        return gender;
    }

    public void setGender(Scholarshipi.Gender gender) {
        this.gender = gender;
    }

    @NotNull
    public int getMinAge() {
        return minAge;
    }

    public void setMinAge(int minAge) {
        this.minAge = minAge;
    }

    @NotNull
    public int getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(int maxAge) {
        this.maxAge = maxAge;
    }

    @NotNull
    public Scholarshipi.ApplicantDegreeRequired getMinDegree() {
        return minDegree;
    }

    public void setMinDegree(Scholarshipi.ApplicantDegreeRequired minDegree) {
        this.minDegree = minDegree;
    }

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }

    public double getMinSchoolGPA() {
        return minSchoolGPA;
    }

    public void setMinSchoolGPA(double minSchoolGPA) {
        this.minSchoolGPA = minSchoolGPA;
    }

    public double getMinUnivGPA() {
        return minUnivGPA;
    }

    public void setMinUnivGPA(double minUnivGPA) {
        this.minUnivGPA = minUnivGPA;
    }

    public Scholarshipi.EnglishLevel getEnglishLevel() {
        return englishLevel;
    }

    public void setEnglishLevel(Scholarshipi.EnglishLevel englishLevel) {
        this.englishLevel = englishLevel;
    }


    @Override
    public String toString() {
        return "ApplicantRequirement{" +
                "id=" + id +
                ", nationality=" + nationality +
                ", residenceIn=" + residenceIn +
                ", major=" + major +
                ", gender=" + gender +
                ", minAge=" + minAge +
                ", maxAge=" + maxAge +
                ", minDegree=" + minDegree +
                ", minSchoolGPA=" + minSchoolGPA +
                ", minUnivGPA=" + minUnivGPA +
                ", englishLevel=" + englishLevel +
                ", scholarship=" + scholarship +
                '}';
    }
}

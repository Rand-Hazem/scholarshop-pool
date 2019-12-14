package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.enums.ScholarshipE;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@MappedSuperclass
public class ApplicantRequirement {

    @Id
    private int id;

    @Column(nullable = false)
    @ElementCollection(fetch = FetchType.LAZY) @CollectionTable(joinColumns = @JoinColumn(name = "scholarship_id"))
    private List<String> nationality;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.ApplicantResidentIn residenceIn;

    @Column(nullable = false)
    @ElementCollection(fetch = FetchType.LAZY) @CollectionTable(joinColumns = @JoinColumn(name = "scholarship_id"))
    private List<String> major;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.Gender gender;

    @Column(nullable = false)
    private int minAge;

    @Column(nullable = false)
    private int maxAge;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.ApplicantDegreeRequired minDegree;

    @Column(nullable = false)
    private double minSchoolGPA;

    @Column(nullable = false)
    private double minUnivGPA;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.EnglishLevel englishLevel;

    @ElementCollection(fetch = FetchType.LAZY) @CollectionTable(joinColumns = @JoinColumn(name = "scholarship_id"))
    private List<SpecialCertificateScore> specialCertificateScoreList;


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

    @NotNull
    public ScholarshipE.ApplicantResidentIn getResidenceIn() {
        return residenceIn;
    }

    public void setResidenceIn(ScholarshipE.ApplicantResidentIn residenceIn) {
        this.residenceIn = residenceIn;
    }

    @NotNull @NotEmpty
    public List<String> getMajor() {
        return major;
    }

    public void setMajor(List<String> major) {
        this.major = major;
    }

    @NotNull
    public ScholarshipE.Gender getGender() {
        return gender;
    }

    public void setGender(ScholarshipE.Gender gender) {
        this.gender = gender;
    }

    @NotNull @Min(value = 10, message = "age grater than 10 year")
    public int getMinAge() {
        return minAge;
    }

    public void setMinAge(int minAge) {
        this.minAge = minAge;
    }

    @NotNull @Min(value = 10, message = "age grater than 10 year")
    public int getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(int maxAge) {
        this.maxAge = maxAge;
    }

    @NotNull
    public ScholarshipE.ApplicantDegreeRequired getMinDegree() {
        return minDegree;
    }

    public void setMinDegree(ScholarshipE.ApplicantDegreeRequired minDegree) {
        this.minDegree = minDegree;
    }

    @Min(0) @Max(4)
    public double getMinSchoolGPA() {
        return minSchoolGPA;
    }

    public void setMinSchoolGPA(double minSchoolGPA) {
        this.minSchoolGPA = minSchoolGPA;
    }

    @Min(0) @Max(4)
    public double getMinUnivGPA() {
        return minUnivGPA;
    }

    public void setMinUnivGPA(double minUnivGPA) {
        this.minUnivGPA = minUnivGPA;
    }

    @NotNull
    public ScholarshipE.EnglishLevel getEnglishLevel() {
        return englishLevel;
    }

    public void setEnglishLevel(ScholarshipE.EnglishLevel englishLevel) {
        this.englishLevel = englishLevel;
    }

    @Valid
    public List<SpecialCertificateScore> getSpecialCertificateScoreList() {
        return specialCertificateScoreList;
    }

    public void setSpecialCertificateScoreList(List<SpecialCertificateScore> specialCertificateScoreList) {
        this.specialCertificateScoreList = specialCertificateScoreList;
    }

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
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
                ", certificate=" + specialCertificateScoreList +
                '}';
    }
}

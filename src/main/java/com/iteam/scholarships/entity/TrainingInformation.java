package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.Scholarshipi;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class TrainingInformation {

    @Id
    private int id;

    @Column(nullable = false)
    private String companyName;

    @Column(nullable = false)
    private String product;

    @Column(nullable = false)
    private String companyWebsite;

    @Column(nullable = false)
    private String location;

    @Column(nullable = false)
    private String workEnvironment;

    @Column(nullable = false)
    private String responsibility;

    private String benefit;

    @Column(nullable = false)  @Enumerated(EnumType.STRING)
    private Scholarshipi.TrainingLanguage trainingLanguage;

    @Column(nullable = false)
    private int weekOffered;

    @Column(nullable = false)
    private int workDayPerWeek;

    @Column(nullable = false)
    private int workHourPerDay;

    @MapsId @OneToOne(fetch = FetchType.LAZY)
    private Scholarship scholarship;

/* ------------------------------------------------------------------------------ */

















    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotBlank(message = "required")
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @NotBlank(message = "required")
    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    @URL(message = "invalid url")
    public String getCompanyWebsite() {
        return companyWebsite;
    }

    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }

    @NotBlank(message = "required")
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @NotBlank(message = "required")
    public String getWorkEnvironment() {
        return workEnvironment;
    }

    public void setWorkEnvironment(String workEnvironment) {
        this.workEnvironment = workEnvironment;
    }

    @NotBlank(message = "required")
    public String getResponsibility() {
        return responsibility;
    }

    public void setResponsibility(String responsibility) {
        this.responsibility = responsibility;
    }

    public String getBenefit() {
        return benefit;
    }

    public void setBenefit(String benefit) {
        this.benefit = benefit;
    }

    @NotNull(message = "required")
    public Scholarshipi.TrainingLanguage getTrainingLanguage() {
        return trainingLanguage;
    }

    public void setTrainingLanguage(Scholarshipi.TrainingLanguage trainingLanguage) {
        this.trainingLanguage = trainingLanguage;
    }

    @Min(value = 1, message = "invalid")
    public int getWeekOffered() {
        return weekOffered;
    }

    public void setWeekOffered(int weekOffered) {
        this.weekOffered = weekOffered;
    }

    @Min(value = 1, message = "invalid")
    @Max(value = 6, message = "there is 7 day per week only")
    public int getWorkDayPerWeek() {
        return workDayPerWeek;
    }

    public void setWorkDayPerWeek(int workDayPerWeek) {
        this.workDayPerWeek = workDayPerWeek;
    }

    @Min(1)
    @Max(value = 12, message = "max is 12")
    public int getWorkHourPerDay() {
        return workHourPerDay;
    }

    public void setWorkHourPerDay(int workHourPerDay) {
        this.workHourPerDay = workHourPerDay;
    }

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }
}

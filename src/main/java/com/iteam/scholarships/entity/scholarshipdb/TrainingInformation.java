package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.enums.ScholarshipE;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.*;

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
    private ScholarshipE.TrainingLanguage trainingLanguage;

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

    @NotBlank @Size(min = 3)
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @NotBlank(message = "required") @Size(min = 3)
    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    @NotNull @URL(message = "invalid url")
    public String getCompanyWebsite() {
        return companyWebsite;
    }

    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }

    @NotBlank(message = "required") @Size(min = 5, message = "very short")
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @NotBlank(message = "required") @Size(min = 5, message = "very short")
    public String getWorkEnvironment() {
        return workEnvironment;
    }

    public void setWorkEnvironment(String workEnvironment) {
        this.workEnvironment = workEnvironment;
    }

    @NotBlank(message = "required") @Size(min = 5, message = "very short")
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
    public ScholarshipE.TrainingLanguage getTrainingLanguage() {
        return trainingLanguage;
    }

    public void setTrainingLanguage(ScholarshipE.TrainingLanguage trainingLanguage) {
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

    @Min(1) @Max(value = 12, message = "max is 12")
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


    @Override
    public String toString() {
        return "TrainingInformation{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", product='" + product + '\'' +
                ", companyWebsite='" + companyWebsite + '\'' +
                ", location='" + location + '\'' +
                ", workEnvironment='" + workEnvironment + '\'' +
                ", responsibility='" + responsibility + '\'' +
                ", benefit='" + benefit + '\'' +
                ", trainingLanguage=" + trainingLanguage +
                ", weekOffered=" + weekOffered +
                ", workDayPerWeek=" + workDayPerWeek +
                ", workHourPerDay=" + workHourPerDay +
                ", scholarship=" + scholarship +
                '}';
    }
}

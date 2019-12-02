package com.iteam.scholarships.entity;

import com.iteam.scholarships.convertor.ListStringConvertor;
import com.iteam.scholarships.enums.ScholarshipE;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.Date;

@Entity
public class Scholarship {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.Type type;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private String country;

    @Column(nullable = false)
    private String city;

    @Temporal(TemporalType.DATE)
    private Date applayDeadline;

    @Column(nullable = false) @Temporal(TemporalType.DATE)
    private Date durationFrom;

    @Column(nullable = false) @Temporal(TemporalType.DATE)
    private Date durationTo;

    @Column(nullable = false)
    private int seats;

    @Column(nullable = false)
    private ScholarshipE.FundType fundType;

    @Column(nullable = false)
    private double fundAmount;

    @Convert(converter = ListStringConvertor.class)
    private ArrayList<ScholarshipE.FundCover> fundCovers;

    private String officialWebsite;

    private String privilege;

    @Column(nullable = false)
    private String providreOrg;

    private String specialProgram;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.Degree degree;
























    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotBlank
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @NotBlank
    public ScholarshipE.Type getType() {
        return type;
    }

    public void setType(ScholarshipE.Type type) {
        this.type = type;
    }

    @NotBlank
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @NotBlank
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @NotBlank
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Date getApplayDeadline() {
        return applayDeadline;
    }

    public void setApplayDeadline(Date applayDeadline) {
        this.applayDeadline = applayDeadline;
    }

    @NotNull(message = "required")
    @Future(message = "must be in future")
    public Date getDurationFrom() {
        return durationFrom;
    }

    public void setDurationFrom(Date durationFrom) {
        this.durationFrom = durationFrom;
    }

    @NotNull(message = "required")
    @Future(message = "must be in future")
    public Date getDurationTo() {
        return durationTo;
    }

    public void setDurationTo(Date durationTo) {
        this.durationTo = durationTo;
    }

    @NotNull(message = "required")
    @Min(1)
    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    @NotBlank
    public ScholarshipE.FundType getFundType() {
        return fundType;
    }

    public void setFundType(ScholarshipE.FundType fundType) {
        this.fundType = fundType;
    }

    @NotNull
    public double getFundAmount() {
        return fundAmount;
    }

    public void setFundAmount(double fundAmount) {
        if (ScholarshipE.FundType.NO.equals(getFundType())) {
            this.fundAmount = 0;
        } else {
            this.fundAmount = fundAmount;

        }
    }

    @URL(message = "invalid url")
    public String getOfficialWebsite() {
        return officialWebsite;
    }

    public void setOfficialWebsite(String officialWebsite) {
        this.officialWebsite = officialWebsite;
    }

    public String getPrivilege() {
        return privilege;
    }

    public void setPrivilege(String privilege) {
        this.privilege = privilege;
    }


    public ArrayList<ScholarshipE.FundCover> getFundCovers() {
        return fundCovers;
    }

    public void setFundCovers(ArrayList<ScholarshipE.FundCover> fundCovers) {
        this.fundCovers = fundCovers;
    }

    @NotNull(message = "required")
    public String getProvidreOrg() {
        return providreOrg;
    }

    public void setProvidreOrg(String providreOrg) {
        this.providreOrg = providreOrg;
    }

    public String getSpecialProgram() {
        return specialProgram;
    }

    public void setSpecialProgram(String specialProgram) {
        this.specialProgram = specialProgram;
    }
}

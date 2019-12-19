package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.convertor.EnumListFundCoverToStringConvertor;
import com.iteam.scholarships.entity.Advertiser;
import com.iteam.scholarships.enums.ScholarshipE;
import org.hibernate.validator.constraints.URL;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
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
    private String country; // host country

    @Column(nullable = false)
    private String city;

    @Temporal(TemporalType.DATE) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date applyDeadline;

    @Column(nullable = false) @Temporal(TemporalType.DATE)  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date durationFrom;

    @Column(nullable = false) @Temporal(TemporalType.DATE) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date durationTo;

    @Column(nullable = false)
    private int seats;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.FundType fundType;

    @Column(nullable = false)
    private double fundAmount;

    @Convert(converter = EnumListFundCoverToStringConvertor.class)
    private ArrayList<ScholarshipE.FundCover> fundCover;

    private String officialWebsite;

    private String privilege;

    @Column(nullable = false)
    private String providreOrg;

    private String specialProgram;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private ScholarshipE.Degree degree;

    @Column(name = "advertiser_id", insertable = false, updatable = false)
    private int advertiserId;


    /* ----------------------------------------------------------------- */
    @ManyToOne(fetch = FetchType.LAZY, optional = false) @JoinColumn(name = "advertiser_id")
    private Advertiser advertiser;



    public Scholarship() {
    }

    public Scholarship(int id) {
        this.id = id;
    }



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

    @NotNull
    public ScholarshipE.Type getType() {
        return type;
    }

    public void setType(ScholarshipE.Type type) {
        this.type = type;
    }

    @NotBlank @Size(min = 10, message = "at least 10 character")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @NotBlank @Size(min = 2, max = 2, message = "invalid country")
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

    @Future
    public Date getApplyDeadline() {
        return applyDeadline;
    }

    public void setApplyDeadline(Date applyDeadline) {
        this.applyDeadline = applyDeadline;
    }

    @NotNull @Future(message = "must be in future")
    public Date getDurationFrom() {
        return durationFrom;
    }

    public void setDurationFrom(Date durationFrom) {
        this.durationFrom = durationFrom;
    }

    @NotNull @Future(message = "must be in future")
    public Date getDurationTo() {
        return durationTo;
    }

    public void setDurationTo(Date durationTo) {
        this.durationTo = durationTo;
    }

    @NotNull @Min(1)
    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    @NotNull
    public ScholarshipE.FundType getFundType() {
        return fundType;
    }

    public void setFundType(ScholarshipE.FundType fundType) {
        this.fundType = fundType;
    }

    @NotNull @Min(0)
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

    public ArrayList<ScholarshipE.FundCover> getFundCover() {
        return fundCover;
    }

    public void setFundCover(ArrayList<ScholarshipE.FundCover> fundCover) {
        this.fundCover = fundCover;
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

    @NotBlank(message = "required")
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

    @NotNull
    public ScholarshipE.Degree getDegree() {
        return degree;
    }

    public void setDegree(ScholarshipE.Degree degree) {
        this.degree = degree;
    }

    public int getAdvertiserId() {
        return advertiserId;
    }

    public void setAdvertiserId(int advertiserId) {
        this.advertiserId = advertiserId;
    }

    public Advertiser getAdvertiser() {
        return advertiser;
    }

    public void setAdvertiser(Advertiser advertiser) {
        this.advertiser = advertiser;
    }

    @Override
    public String toString() {
        return "Scholarship{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", type=" + type +
                ", description='" + description + '\'' +
                ", country='" + country + '\'' +
                ", city='" + city + '\'' +
                ", applyDeadline=" + applyDeadline +
                ", durationFrom=" + durationFrom +
                ", durationTo=" + durationTo +
                ", seats=" + seats +
                ", fundType=" + fundType +
                ", fundAmount=" + fundAmount +
                ", fundCovers=" + fundCover +
                ", officialWebsite='" + officialWebsite + '\'' +
                ", privilege='" + privilege + '\'' +
                ", providreOrg='" + providreOrg + '\'' +
                ", specialProgram='" + specialProgram + '\'' +
                ", degree=" + degree +
                ", advertiserId=" + advertiserId +
                ", advertiser=" + advertiser +
                '}';
    }
}

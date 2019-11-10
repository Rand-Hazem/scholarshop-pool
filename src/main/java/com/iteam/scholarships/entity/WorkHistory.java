package com.iteam.scholarships.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Date;

@Entity
@Table(name = "work_history")
public class WorkHistory {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "company_name", nullable = false)
    private String companyName;

    @Column( nullable = false)
    private String position;

   @Column( nullable = false) @Temporal(TemporalType.DATE) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date startDate;

    @Temporal(TemporalType.DATE) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endDate; //  nullable = true, may be until this day

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User user;

    public WorkHistory() {
    }

    public WorkHistory(String companyName, String position, Date startDate, Date endDate, User user) {
        this.companyName = companyName;
        this.position = position;
        this.startDate = startDate;
        this.endDate = endDate;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotBlank(message = "invalid company name")
    @Size(min = 3, message = "invalid company name")
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @NotBlank(message = "invalid position")
    @Size(min = 6, message = "invalid position")
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @NotNull
    @Past(message = "invalid start date")
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Past(message = "invalid end date")
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "WorkHistory{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", position='" + position + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }
}

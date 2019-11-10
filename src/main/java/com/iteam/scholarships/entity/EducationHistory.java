package com.iteam.scholarships.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name = "education_history")
public class EducationHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column( nullable = false)
    private String university;

    @Column( nullable = false)
    private String description;

    @Column( nullable = false) @Temporal(TemporalType.DATE) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date startDate;

    @Temporal(TemporalType.DATE) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endDate; //  nullable = true, may be until this day

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User user;

    public EducationHistory() {
    }

    public EducationHistory(String university, String description, Date startDate, Date endDate) {
        this.university = university;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotBlank(message = "university is required")
    @Size(min=3, message = "invalid university")
    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    @NotBlank(message = "description is required")
    @Size(min=3, message = "invalid description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @NotNull(message = "start date is required")
    @Past(message = "end date must be in past")
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Past(message = "end date must be in past")
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
        return "EducationHistory{" +
                "id=" + id +
                ", university='" + university + '\'' +
                ", description='" + description + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }
}

package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.Scholarshipi;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
public class AcademicInformation {

    @Id
    private int id;

    @Column(nullable = false)
    private String hostUniversity;

    @Enumerated(EnumType.STRING)
    private Scholarshipi.TeachingLanguage teachingLanguage;

    @ElementCollection
    @CollectionTable(name="scholarship_Academic_information_major", joinColumns = @JoinColumn(name = "scholarship_id"))
    private List<String> major;


    @MapsId @OneToOne(fetch = FetchType.LAZY)
    private Scholarship scholarship;

/* --------------------------------------------------------------- */


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotBlank(message = "required")
    public String getHostUniversity() {
        return hostUniversity;
    }

    public void setHostUniversity(String hostUniversity) {
        this.hostUniversity = hostUniversity;
    }

    @NotNull(message = "required")
    public Scholarshipi.TeachingLanguage getTeachingLanguage() {
        return teachingLanguage;
    }

    public void setTeachingLanguage(Scholarshipi.TeachingLanguage teachingLanguage) {
        this.teachingLanguage = teachingLanguage;
    }

    @NotNull(message = "required") @Min(value = 1)
    public List<String> getMajor() {
        return major;
    }

    public void setMajor(List<String> major) {
        this.major = major;
    }

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }


    @Override
    public String toString() {
        return "AcademicInformation{" +
                "id=" + id +
                ", hostUniversity='" + hostUniversity + '\'' +
                ", teachingLanguage=" + teachingLanguage +
                ", major=" + major +
                ", scholarship=" + scholarship +
                '}';
    }
}

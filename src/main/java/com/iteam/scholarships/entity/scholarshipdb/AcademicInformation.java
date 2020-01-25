package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.enums.ScholarshipE;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Indexed
public class AcademicInformation {

    @Id
    private int id;

    @Column(nullable = false)
    private String hostUniversity;

    @Enumerated(EnumType.STRING) @Field
    private ScholarshipE.Language teachingLanguage;

    @ElementCollection
    @CollectionTable(name="scholarship_Academic_information_major", joinColumns = @JoinColumn(name = "scholarship_id"))
    @IndexedEmbedded @Field
    private List<String> major;


    @MapsId @OneToOne(fetch = FetchType.LAZY) @IndexedEmbedded
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
    public ScholarshipE.Language getTeachingLanguage() {
        return teachingLanguage;
    }

    public void setTeachingLanguage(ScholarshipE.Language teachingLanguage) {
        this.teachingLanguage = teachingLanguage;
    }

    @NotNull(message = "required")@NotEmpty
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

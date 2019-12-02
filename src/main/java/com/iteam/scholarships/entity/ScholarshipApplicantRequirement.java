package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.ScholarshipE;

import javax.persistence.*;
import java.util.List;

@Entity
public class ScholarshipApplicantRequirement {


    private int id;

    @ElementCollection @CollectionTable(name = "sh_applicant_requiremt_nationality")
    private List<String> nationality;

    @ElementCollection @CollectionTable(name = "sh_applicant_requiremt_residenceIn")
    private List<String> residenceIn;

    @Enumerated(EnumType.STRING)
    private ScholarshipE.Gender gender;

    private int minAge;

    private int maxAge;


    @MapsId
    @OneToOne(fetch = FetchType.LAZY)
    private Scholarship scholarship;



}

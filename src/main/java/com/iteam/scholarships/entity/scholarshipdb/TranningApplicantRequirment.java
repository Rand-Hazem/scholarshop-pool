package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.entity.scholarshipdb.ApplicantRequirement;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;

@Entity
public class TranningApplicantRequirment extends ApplicantRequirement {

    @Column(nullable = false)
    private String knowledgeAndExperience;

    @Column(nullable = false)
    private String other;


    @NotBlank
    public String getKnowledgeAndExperience() {
        return knowledgeAndExperience;
    }

    public void setKnowledgeAndExperience(String knowledgeAndExperience) {
        this.knowledgeAndExperience = knowledgeAndExperience;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }


    @Override
    public String toString() {
        return "TranningApplicantRequirment{" +
                "knowledgeAndExperience='" + knowledgeAndExperience + '\'' +
                ", other='" + other + '\'' +
                '}';
    }
}

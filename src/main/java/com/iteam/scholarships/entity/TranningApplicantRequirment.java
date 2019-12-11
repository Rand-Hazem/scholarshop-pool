package com.iteam.scholarships.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class TranningApplicantRequirment extends ApplicantRequirement {

    @Column(nullable = false)
    private String knowledgeAndExperience;

    @Column(nullable = false)
    private String other;


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
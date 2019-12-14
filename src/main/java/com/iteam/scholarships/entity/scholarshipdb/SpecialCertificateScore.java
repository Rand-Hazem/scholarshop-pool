package com.iteam.scholarships.entity.scholarshipdb;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Embeddable
public class SpecialCertificateScore {

    @Column(nullable = false)
    private String certificate;

    @Column(nullable = false)
    private float score;


    public SpecialCertificateScore() {
    }

    public SpecialCertificateScore(String certificate, float score) {
        this.certificate = certificate;
        this.score = score;
    }

    @NotBlank @Size(min = 3, message = "too short")
    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    @Min(1) @Max(10)
    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "{" +
                "certificate='" + certificate + '\'' +
                ", score=" + score +
                '}';
    }
}

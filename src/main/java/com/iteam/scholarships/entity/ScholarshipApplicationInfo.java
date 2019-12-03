package com.iteam.scholarships.entity;

import com.iteam.scholarships.convertor.ListEnumDocumentToStringConvertor;
import com.iteam.scholarships.enums.Scholarshipi;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
public class ScholarshipApplicationInfo {

    @Id
    private int id;

    @Column(nullable = false)
    @Convert(converter = ListEnumDocumentToStringConvertor.class)
    private List<Scholarshipi.RequiredDocument> requiredDocumentList;

    private String otherRequiredDoc;

    @Column(nullable = false)
    private String howToApply;

    @Column(nullable = false)
    private boolean applyThroughProviderWebsite;

    private String urlProviderApplyForm;

    private String illustrationFileName;

    @MapsId @OneToOne(fetch = FetchType.LAZY)
    private Scholarship scholarship;

/* ---------------------------------------------------------------- */

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotNull @NotEmpty
    public List<Scholarshipi.RequiredDocument> getRequiredDocumentList() {
        return requiredDocumentList;
    }

    public void setRequiredDocumentList(List<Scholarshipi.RequiredDocument> requiredDocumentList) {
        this.requiredDocumentList = requiredDocumentList;
    }

    public String getOtherRequiredDoc() {
        return otherRequiredDoc;
    }

    public void setOtherRequiredDoc(String otherRequiredDoc) {
        this.otherRequiredDoc = otherRequiredDoc;
    }

    @NotBlank
    public String getHowToApply() {
        return howToApply;
    }

    public void setHowToApply(String howToApply) {
        this.howToApply = howToApply;
    }

    @NotNull
    public boolean isApplyThroughProviderWebsite() {
        return applyThroughProviderWebsite;
    }

    public void setApplyThroughProviderWebsite(boolean applyThroughProviderWebsite) {
        this.applyThroughProviderWebsite = applyThroughProviderWebsite;
    }

    @URL
    public String getUrlProviderApplyForm() {
        return urlProviderApplyForm;
    }

    public void setUrlProviderApplyForm(String urlProviderApplyForm) {
        this.urlProviderApplyForm = urlProviderApplyForm;
    }

    public String getIllustrationFileName() {
        return illustrationFileName;
    }

    public void setIllustrationFileName(String illustrationFileName) {
        this.illustrationFileName = illustrationFileName;
    }

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }
}

package com.iteam.scholarships.entity.scholarshipdb;

import com.iteam.scholarships.convertor.EnumListDocumentToStringConvertor;
import com.iteam.scholarships.enums.ScholarshipE;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
public class ScholarshipApplicationDetail {

    @Id
    private int id;

    @Column(nullable = false)
    @Convert(converter = EnumListDocumentToStringConvertor.class)
    private List<ScholarshipE.RequiredDocument> requiredDocumentList;

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
    public List<ScholarshipE.RequiredDocument> getRequiredDocumentList() {
        return requiredDocumentList;
    }

    public void setRequiredDocumentList(List<ScholarshipE.RequiredDocument> requiredDocumentList) {
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
        if(!applyThroughProviderWebsite){
            setUrlProviderApplyForm("");
        }
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


    @Override
    public String toString() {
        return "ScholarshipApplicationDetail{" +
                "id=" + id +
                ", requiredDocumentList=" + requiredDocumentList +
                ", otherRequiredDoc='" + otherRequiredDoc + '\'' +
                ", howToApply='" + howToApply + '\'' +
                ", applyThroughProviderWebsite=" + applyThroughProviderWebsite +
                ", urlProviderApplyForm='" + urlProviderApplyForm + '\'' +
                ", illustrationFileName='" + illustrationFileName + '\'' +
                ", scholarship=" + scholarship +
                '}';
    }
}

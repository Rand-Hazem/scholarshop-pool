package com.iteam.scholarships.wrapper;

import com.iteam.scholarships.entity.scholarshipdb.*;
import com.iteam.scholarships.enums.ScholarshipE;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

public class ShareScholarshipWrapper {

    private Scholarship scholarship;
    private AcademicInformation academicInformation;
    private TrainingInformation trainingInformation;

    private ScholarshipApplicationDetail detail;
    private ApplicantRequirement applicantRequirement;

    private ScholarshipApplicantRequirement scholarshipAppReq;
    private TranningApplicantRequirment tranningApplReq;


    public ShareScholarshipWrapper() {
    }

    @Valid @NotNull
    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }

    @Valid
    public AcademicInformation getAcademicInformation() {
        return academicInformation;
    }

    public void setAcademicInformation(AcademicInformation academicInformation) {
        this.academicInformation = academicInformation;
    }

    @Valid
    public TrainingInformation getTrainingInformation() {
        return trainingInformation;
    }

    public void setTrainingInformation(TrainingInformation trainingInformation) {
        this.trainingInformation = trainingInformation;
    }

    @Valid @NotNull
    public ScholarshipApplicationDetail getDetail() {
        return detail;
    }

    public void setDetail(ScholarshipApplicationDetail detail) {
        this.detail = detail;
    }

    @Valid @NotNull
    public ApplicantRequirement getApplicantRequirement() {
        return applicantRequirement;
    }

    public void setApplicantRequirement(ApplicantRequirement applicantRequirement) {
        this.applicantRequirement = applicantRequirement;
    }

    @Valid
    public ScholarshipApplicantRequirement getScholarshipAppReq() {
        return scholarshipAppReq;
    }

    public void setScholarshipAppReq(ScholarshipApplicantRequirement scholarshipAppReq) {
        this.scholarshipAppReq = scholarshipAppReq;
    }

    @Valid
    public TranningApplicantRequirment getTranningApplReq() {
        return tranningApplReq;
    }

    public void setTranningApplReq(TranningApplicantRequirment tranningApplReq) {
        this.tranningApplReq = tranningApplReq;
    }


    public void copyApplicantRequirement(){

        ApplicantRequirement concreat;

        if(scholarship!= null && ScholarshipE.Type.INTERNSHIP.equals(scholarship.getType())){
            concreat = tranningApplReq == null ? new TranningApplicantRequirment() : tranningApplReq;
        }else{
            scholarshipAppReq = scholarshipAppReq == null ? new ScholarshipApplicantRequirement() : scholarshipAppReq;
            concreat = scholarshipAppReq;
        }
        concreat.setEnglishLevel(applicantRequirement.getEnglishLevel());
        concreat.setGender(applicantRequirement.getGender());
        concreat.setMajor(applicantRequirement.getMajor());
        concreat.setMaxAge(applicantRequirement.getMaxAge());
        concreat.setMinAge(applicantRequirement.getMinAge());
        concreat.setMinDegree(applicantRequirement.getMinDegree());
        concreat.setMinSchoolGPA(applicantRequirement.getMinSchoolGPA());
        concreat.setMinUnivGPA(applicantRequirement.getMinUnivGPA());
        concreat.setNationality(applicantRequirement.getNationality());
        concreat.setResidenceIn(applicantRequirement.getResidenceIn());
    }

    public void filterData(){

        if(scholarship != null && ScholarshipE.Type.INTERNSHIP.equals(scholarship.getType())){
            setAcademicInformation(null);
            setScholarshipAppReq(null);
        }else{
            setTrainingInformation(null);
            setTranningApplReq(null);
        }

    }

    @Override
    public String toString() {
        return "ShareScholarshipWrapper{" +
                "scholarship=" + scholarship +
//                ", academicInformation=" + academicInformation +
//                ", trainingInformation=" + trainingInformation +
//                ", detail=" + detail +
//                ", applicantRequirement=" + applicantRequirement +
//                ", scholarshipAppReq=" + scholarshipAppReq +
//                ", tranningApplReq=" + tranningApplReq +
                '}';
    }
}

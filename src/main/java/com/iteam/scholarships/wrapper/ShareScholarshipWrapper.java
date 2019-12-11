package com.iteam.scholarships.wrapper;

import com.iteam.scholarships.entity.*;
import com.iteam.scholarships.enums.Scholarshipi;

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

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }

    public AcademicInformation getAcademicInformation() {
        return academicInformation;
    }

    public void setAcademicInformation(AcademicInformation academicInformation) {
        this.academicInformation = academicInformation;
    }

    public TrainingInformation getTrainingInformation() {
        return trainingInformation;
    }

    public void setTrainingInformation(TrainingInformation trainingInformation) {
        this.trainingInformation = trainingInformation;
    }

    public ScholarshipApplicationDetail getDetail() {
        return detail;
    }

    public void setDetail(ScholarshipApplicationDetail detail) {
        this.detail = detail;
    }

    public ApplicantRequirement getApplicantRequirement() {
        return applicantRequirement;
    }

    public void setApplicantRequirement(ApplicantRequirement applicantRequirement) {
        this.applicantRequirement = applicantRequirement;
    }

    public ScholarshipApplicantRequirement getScholarshipAppReq() {
        return scholarshipAppReq;
    }

    public void setScholarshipAppReq(ScholarshipApplicantRequirement scholarshipAppReq) {
        this.scholarshipAppReq = scholarshipAppReq;
    }

    public TranningApplicantRequirment getTranningApplReq() {
        return tranningApplReq;
    }

    public void setTranningApplReq(TranningApplicantRequirment tranningApplReq) {
        this.tranningApplReq = tranningApplReq;
    }


    public void copyApplicantRequirement(){

        ApplicantRequirement concreat;

        if(scholarship!= null && Scholarshipi.Type.INTERNSHIP.equals(scholarship.getType())){
            concreat = tranningApplReq == null ? new TranningApplicantRequirment() : tranningApplReq;
        }else{
            concreat = scholarshipAppReq == null ? new ScholarshipApplicantRequirement() : scholarshipAppReq;
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
}

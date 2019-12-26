package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Advertiser;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.scholarshipdb.SavedScholarship;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.enums.ScholarshipE;
import com.iteam.scholarships.repository.*;
import com.iteam.scholarships.wrapper.ScholarshipWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ScholarshipService {

    @Autowired
    private ScholarshipRepository scholarshipRepository;
    @Autowired
    private AcademicInformationRepository academicInformationRepository;
    @Autowired
    private ScholarshipApplicantRequirementRepository scholarshipApplicantRequirementRepository;
    @Autowired
    private ScholarshipApplicationDetailRepository scholarshipApplicationDetailRepository;
    @Autowired
    private TrainingInformationRepository trainingInformationRepository;
    @Autowired
    private TranningApplicantRequirmentRepository tranningApplicantRequirmentRepository;
    @Autowired
    private SavedScholarshipRepository savedScholarshipRepository;
    @Autowired
    private CurrentUser currentUser;


    public boolean share(ScholarshipWrapper wrapper) {
        Scholarship stored;
        // set advertiser
        Advertiser advertiser = new Advertiser(currentUser.getId());
        wrapper.getScholarship().setAdvertiser(advertiser);

        try {
            stored = scholarshipRepository.save(wrapper.getScholarship());
            wrapper.getDetail().setScholarship(stored);
            scholarshipApplicationDetailRepository.save(wrapper.getDetail());

            if (wrapper.getScholarship().getType().equals(ScholarshipE.Type.INTERNSHIP)) {
                wrapper.getTranningApplReq().setScholarship(stored);
                wrapper.getTrainingInformation().setScholarship(stored);
                trainingInformationRepository.save(wrapper.getTrainingInformation());
                tranningApplicantRequirmentRepository.save(wrapper.getTranningApplReq());
            } else {
                wrapper.getAcademicInformation().setScholarship(stored);
                wrapper.getScholarshipAppReq().setScholarship(stored);

                academicInformationRepository.save(wrapper.getAcademicInformation());
                scholarshipApplicantRequirementRepository.save(wrapper.getScholarshipAppReq());
            }
        } catch (Exception e) {
            System.out.println("\n\n");
            e.printStackTrace();
            return false;
        }


        return stored.getId() > 0;
    }


    public boolean delete(int id) {
        Scholarship scholarship = scholarshipRepository.findById(id).orElse(null);
        // sh not exists, or denaid access
        if (scholarship == null || scholarship.getAdvertiserId() != currentUser.getId()) {
            return false;
        }

        if (scholarship.getType().equals(ScholarshipE.Type.INTERNSHIP)) {
            trainingInformationRepository.deleteById(id);
            tranningApplicantRequirmentRepository.deleteById(id);
        } else {
            academicInformationRepository.deleteById(id);
            scholarshipApplicantRequirementRepository.deleteById(id);
        }

        scholarshipApplicationDetailRepository.deleteById(id);
        scholarshipRepository.deleteById(id);

        return true;
    }


    public List<Scholarship> getAllScholarships() {
        return scholarshipRepository.findAllByAdvertiser(new Advertiser(currentUser.getId()));
    }


    public void findForView(int id, ScholarshipWrapper scholarshipWrapper) {
        Scholarship scholarship = scholarshipRepository.findById(id).orElse(null);
        if (scholarship == null) {
            return;
        }

        scholarshipWrapper.setScholarship(scholarship);
        scholarshipWrapper.setDetail(scholarshipApplicationDetailRepository.findById(id).orElse(null));

        if (scholarship.getType().equals(ScholarshipE.Type.INTERNSHIP)) {
            scholarshipWrapper.setTrainingInformation(trainingInformationRepository.findById(id).orElse(null));
            scholarshipWrapper.setTranningApplReq(tranningApplicantRequirmentRepository.findById(id).orElse(null));
        } else {
            scholarshipWrapper.setAcademicInformation(academicInformationRepository.findById(id).orElse(null));
            scholarshipWrapper.setScholarshipAppReq(scholarshipApplicantRequirementRepository.findById(id).orElse(null));
        }
    }

    /** Add scholarship to save-sh table 'favourite list'
     */
    public boolean save(int scholarshipId) {
        SavedScholarship saved = savedScholarshipRepository.findByScholarshipAndUser(
                new Scholarship(scholarshipId), new User(currentUser.getId()));

        System.out.println(saved);

        if (saved != null) {
            return true;
        }

        SavedScholarship savedScholarship = new SavedScholarship();
        saved.setScholarshipId(scholarshipId);
        saved.setUserId(currentUser.getId());

        savedScholarshipRepository.save(savedScholarship);

        return savedScholarship != null && savedScholarship.getId() > 0;
    }

    /** delete  saved-sh row
     */
    public boolean unsave(int scholarshipId) {
        int deletes = savedScholarshipRepository.deleteByScholarshipAndUser(new Scholarship(scholarshipId), new User(currentUser.getId()));
        return deletes > 0;
    }


}

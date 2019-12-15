package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Advertiser;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.enums.ScholarshipE;
import com.iteam.scholarships.repository.*;
import com.iteam.scholarships.wrapper.ShareScholarshipWrapper;
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
    private CurrentUser currentUser;


    public boolean share(ShareScholarshipWrapper wrapper) {
        Scholarship stored;

//        Advertiser advertiser = new Advertiser();
//        advertiser.setUser(new User(currentUser.getId()));
//        wrapper.getScholarship().setAdvertiser(advertiser);

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



    public boolean delete(int id){
        Scholarship scholarship = scholarshipRepository.findById(id).orElse(null);
        // sh not exists, or denaid access
        if(scholarship == null || scholarship.getAdvertiserId() != currentUser.getId()){
            return false;
        }

        if(scholarship.getType().equals(ScholarshipE.Type.INTERNSHIP)){
            trainingInformationRepository.deleteById(id);
            tranningApplicantRequirmentRepository.deleteById(id);
        }else{
            academicInformationRepository.deleteById(id);
            scholarshipApplicantRequirementRepository.deleteById(id);
        }

        scholarshipApplicationDetailRepository.deleteById(id);
        scholarshipRepository.deleteById(id);

        return true;
    }



    public List<Scholarship> getAllScholarships(){
        return scholarshipRepository.findAllByAdvertiser(new Advertiser(currentUser.getId()));
    }

}

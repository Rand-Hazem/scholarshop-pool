package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Advertiser;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.enums.ScholarshipE;
import com.iteam.scholarships.repository.*;
import com.iteam.scholarships.wrapper.ShareScholarshipWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

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

        // set advertiser
        wrapper.getScholarship().setAdvertiserId(4);
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


}

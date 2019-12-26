package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.entity.scholarshipdb.ScholarshipSubmitedApplication;
import com.iteam.scholarships.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class ScholarshipApplyService {

//    @Autowired
//    private ScholarshipSubmitApplicationRepository applicationRepository;
    @Autowired
    private ScholarshipRepository scholarshipRepository;
    @Autowired
    private CurrentUser currentUser;



    public boolean alreadyApply(int shId){
//        return applicationRepository.findByScholarshipIdAndStudentId(shId, currentUser.getId());
        return false;
    }


    public boolean apply(ScholarshipSubmitedApplication application){
        Scholarship scholarship = scholarshipRepository.findById(application.getId()).orElse(null);
        if(scholarship == null){
            return false;
        }
        application.setScholarship(scholarship);
        application.setStudentId(currentUser.getId());

//        applicationRepository.save(application);

        return application != null && application.getId() >0 ;
    }



}

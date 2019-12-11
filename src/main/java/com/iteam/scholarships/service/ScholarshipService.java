package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.ScholarshipApplicationDetail;
import com.iteam.scholarships.repository.*;
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





}

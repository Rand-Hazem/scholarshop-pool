package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Student;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.entity.scholarshipdb.ScholarshipApplicantStudent;
import com.iteam.scholarships.entity.scholarshipdb.StudentApplyProfile;
import com.iteam.scholarships.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Calendar;

@Service
@Transactional
public class ScholarshipApplyService {

    @Autowired
    private StudentApplyProfileRepository studentApplyProfileRepository;
    @Autowired
    private ScholarshipRepository scholarshipRepository;
    @Autowired
    private ScholarshipApplicantStudentRepository scholarshipApplicantStudentRepository;
    @Autowired
    private CurrentUser currentUser;


    public boolean alreadyApply(int shId) {
        return scholarshipApplicantStudentRepository.isStudentApply(shId, currentUser.getId());
    }

    public StudentApplyProfile getCurrentUserProfile() {
        return studentApplyProfileRepository.findById(currentUser.getId()).orElse(null);
    }


    public boolean apply(StudentApplyProfile profile, int scholarshipId) {
        Scholarship scholarship = scholarshipRepository.findById(scholarshipId).orElse(null);
        if (scholarship == null) {
            return false;
        }

        profile.setId(currentUser.getId());
        studentApplyProfileRepository.save(profile);

        // apply to scholarship
        if(!alreadyApply(scholarshipId)){
            ScholarshipApplicantStudent apply = new ScholarshipApplicantStudent();
            apply.setDate(Calendar.getInstance().getTime());
            apply.setStudentId(currentUser.getId());
            apply.setScholarship(new Scholarship(scholarshipId));
            scholarshipApplicantStudentRepository.save(apply);
        }

        return profile != null && profile.getId() > 0;
    }


}

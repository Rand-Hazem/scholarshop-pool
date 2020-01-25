package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Student;
import com.iteam.scholarships.entity.StudentInterest;
import com.iteam.scholarships.repository.StudentInterestRepository;
import com.iteam.scholarships.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private StudentInterestRepository studentInterestRepository;
    @Autowired
    private CurrentUser currentUser;


    public Student register(Student student) {
        return studentRepository.save(student);
    }


    public boolean saveInterest(StudentInterest interest) {
        interest.setStudentId(currentUser.getId());
        studentInterestRepository.save(interest);
        return true;
    }


    public StudentInterest getStudentInterest(){
        return studentInterestRepository.findById(currentUser.getId()).orElse(new StudentInterest());
    }

    public StudentInterest findStudentInterest(){
        return studentInterestRepository.findStudentInterestByStudentId(currentUser.getId());
    }

}



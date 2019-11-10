package com.iteam.scholarships.service;

import com.iteam.scholarships.entity.Student;
import com.iteam.scholarships.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public Student register(Student student){
        return studentRepository.save(student);
    }
}



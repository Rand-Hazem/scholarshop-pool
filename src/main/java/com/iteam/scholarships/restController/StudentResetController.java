package com.iteam.scholarships.restController;

import com.iteam.scholarships.entity.StudentInterest;
import com.iteam.scholarships.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/student")
public class StudentResetController {

    @Autowired
    private StudentService studentService;

    @PutMapping("update-interest")
    @PreAuthorize("hasAuthority('student')")
    public ResponseEntity updateInterest(@Valid StudentInterest interest, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
           return ResponseEntity.badRequest().build();
        }

        studentService.saveInterest(interest);
        return ResponseEntity.ok().build();
    }
}

package com.iteam.scholarships.restController;

import com.iteam.scholarships.service.ScholarshipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ScholarshipRestController {

    @Autowired
    private ScholarshipService scholarshipService;

    @DeleteMapping("/advertiser/scholarship")
    public ResponseEntity delete(@RequestParam(required = false) int id) {
        if (id > 0 && scholarshipService.delete(id)) {
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().build();
    }


    @PutMapping("/student/scholarship/save")
    public ResponseEntity save(@RequestParam(required = false) int id) {
        if (id > 0 && scholarshipService.save(id)) {
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().build();
    }


    @PutMapping("/student/scholarship/unsave")
    public ResponseEntity unsave(@RequestParam(required = false) int id) {
        if (id > 0 && scholarshipService.unsave(id)) {
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().build();
    }





}

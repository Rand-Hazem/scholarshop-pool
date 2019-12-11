package com.iteam.scholarships.controller;


import com.iteam.scholarships.wrapper.ShareScholarshipWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Controller
@RequestMapping("/scholarship/")
public class ScholarshipController {



    @GetMapping("share")
    public String share(Model model){
        model.addAttribute("wrapper", new ShareScholarshipWrapper());
        return "share-scholarship";
    }

    @PostMapping("share")
    public String share(@ModelAttribute("wrapper") ShareScholarshipWrapper wrapper, Model model) {
        String line="\n\n";

//        System.out.println(line+wrapper.getScholarship()+line);
//        System.out.println(line+wrapper.getAcademicInformation()+line);
//        System.out.println(line+wrapper.getTrainingInformation()+line);
//        System.out.println(line+wrapper.getApplicantRequirement()+line);
//        System.out.println(line+wrapper.getTranningApplReq()+line);
//        System.out.println(line+wrapper.getDetail()+line);

        return "share-scholarship";
    }



    @GetMapping("adverted-scholarship")
    public String viewAdvertedScholarship(Model model){
        return "adverted-scholarships";
    }


    @GetMapping({"{id}", "{id}/{title}"})
    public String viewScholarship(@PathVariable("id") int id, Model model){

        // put data into model

        return "view-scholarship";
    }

}

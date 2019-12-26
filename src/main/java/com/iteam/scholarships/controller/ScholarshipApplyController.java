package com.iteam.scholarships.controller;

import com.iteam.scholarships.entity.scholarshipdb.ScholarshipSubmitedApplication;
import com.iteam.scholarships.service.ScholarshipApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/student/")
public class ScholarshipApplyController {

    @Autowired
    private ScholarshipApplyService scholarshipApplyService;


    @GetMapping("apply")
    public String apply(@RequestParam(value = "shId", required = false) int shId, Model model) {
        if(shId < 1){
            return "redirect:/user/scholarship/explore";
        }

        if (scholarshipApplyService.alreadyApply(shId)) {
           return "redirect:/student/apply/update?shId="+shId;
        }
        ScholarshipSubmitedApplication application = new ScholarshipSubmitedApplication();
        application.setScholarshipId(shId);
        model.addAttribute("application", application);

        return "submit-application";
    }



    @PostMapping("apply")
    public String apply(@Valid @ModelAttribute("application")ScholarshipSubmitedApplication application, BindingResult bindingResult) {
        if (!scholarshipApplyService.apply(application)) {
            return "submit-application";
        }
        return "submit-application"; // redirect to all apllication student apply for OR edit application
    }


    @GetMapping("apply/update")
    public String update(@RequestParam(value = "shId", required = false) int shId, Model model) {
        model.addAttribute("shId", shId);
        return "submit-application";  // must be edit-submited-spplication page
    }




}

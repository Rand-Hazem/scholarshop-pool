package com.iteam.scholarships.controller;

import com.iteam.scholarships.entity.scholarshipdb.ApplicantRequirement;
import com.iteam.scholarships.entity.scholarshipdb.StudentApplyProfile;
import com.iteam.scholarships.service.ScholarshipApplyService;
import com.iteam.scholarships.service.ScholarshipService;
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
    @Autowired
    private ScholarshipService scholarshipService;


    private void setApplyViewToModel(int scholarshipId, Model model){

        StudentApplyProfile application = scholarshipApplyService.getCurrentUserProfile();
        if (application == null) {
            application = new StudentApplyProfile();
        }
        model.addAttribute("profile", application);

        ApplicantRequirement applicantRequirement = scholarshipService.getApplicantRequirement(scholarshipId);
        model.addAttribute("applicantRequirement", applicantRequirement);
    }

    @GetMapping("scholarship/{id}/apply")
    public String apply(@PathVariable(value = "id", required = false) int scholarshipId, Model model) {
        if (scholarshipId < 1) {
            return "redirect:/user/scholarship/explore";
        }

        model.addAttribute("scholarshipId", scholarshipId);
        setApplyViewToModel(scholarshipId, model);
        if (scholarshipApplyService.alreadyApply(scholarshipId)) {
            model.addAttribute("alreadyApply", true);
        }

        return "submit-application";
    }


    @PostMapping("scholarship/{id}/apply")
    public String apply(@Valid @ModelAttribute("profile") StudentApplyProfile profile, BindingResult bindingResult
            , @PathVariable(value = "id") int scholarshipId, Model model) {

        model.addAttribute("scholarshipId", scholarshipId);
        if (bindingResult.hasErrors() || scholarshipId < 1
                || !scholarshipApplyService.apply(profile, scholarshipId)) {
            setApplyViewToModel(scholarshipId, model);
            model.addAttribute("failed", true);
            return "submit-application";
        }

        return "submit-application"; // redirect to all apllication student apply for OR edit application
    }


}

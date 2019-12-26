package com.iteam.scholarships.controller;

import com.iteam.scholarships.component.UplodeFille;
import com.iteam.scholarships.service.ScholarshipService;
import com.iteam.scholarships.service.UserService;
import com.iteam.scholarships.wrapper.ScholarshipWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.SmartValidator;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class ScholarshipController {

    @Autowired
    private SmartValidator validator;
    @Autowired
    private UplodeFille uplodeFille;
    @Autowired
    private ScholarshipService scholarshipService;
    @Autowired
    private UserService userService;


    @GetMapping("/advertiser/scholarship/share")
    public String share(Model model) {
        model.addAttribute("wrapper", new ScholarshipWrapper());
        return "share-scholarship";
    }


    @PostMapping("/advertiser/scholarship/share")
    public String share(@ModelAttribute("wrapper") ScholarshipWrapper wrapper, BindingResult bindingResult,
                        @RequestParam(value = "illustrationFile", required = false) MultipartFile file, Model model) {
        wrapper.copyApplicantRequirement();
        wrapper.filterData();
        validator.validate(wrapper, bindingResult);
        // check valid file if exists
        boolean fileError = false;
        if (file != null && !uplodeFille.validPDF(file.getOriginalFilename()) && !file.isEmpty()) {
            model.addAttribute("fileErrorMsg", "invalid file");
            fileError = true;
        }

        // chek errors
        if (bindingResult.hasErrors() || fileError) {
            return "share-scholarship";
        }

        // store data, if true update file and go to view page
        if (scholarshipService.share(wrapper)) {
            uplodeFille.uploadScholarshipIllustrationFile(file);
            return "redirect:/user/scholarship/"
                    + wrapper.getScholarship().getId() + "/"
                    + wrapper.getScholarship().getTitle().replaceAll(" ", "-");
        }

        return "share-scholarship";
    }

    @GetMapping("/advertiser/scholarship/{id}/update")
    public String update(@PathVariable("id") int id) {
        // set the data from model
        return "update-scholarship";
    }


    @GetMapping("/advertiser/scholarship")
    public String viewAdverted(Model model) {
        model.addAttribute("scholarships", scholarshipService.getAllScholarships());

        return "adverted-scholarships";
    }


    @GetMapping({"/user/scholarship/{id}", "/user/scholarship/{id}/{title}"}) // visitors and register one
    public String view(@PathVariable("id") int id, Model model) {
        ScholarshipWrapper wrapper = new ScholarshipWrapper();
        if (id < 1) {
            return "search-scholarship";
        }

        scholarshipService.findForView(id, wrapper);
        if (wrapper.getScholarship() == null) {
            return "search-scholarship";
        }

        model.addAttribute("user",userService.findUserHeader(wrapper.getScholarship().getAdvertiserId()));
        model.addAttribute("scholarship",wrapper.getScholarship());
        model.addAttribute("academicInformation",wrapper.getAcademicInformation());
        model.addAttribute("applicantRequirement",wrapper.getScholarshipAppReq());
        model.addAttribute("trainingInformation",wrapper.getTrainingInformation());
        model.addAttribute("tranningApplicantRequirment",wrapper.getTranningApplReq());
        model.addAttribute("scholarshipApplicationDetail",wrapper.getDetail());


        return "view-scholarship";
    }


}

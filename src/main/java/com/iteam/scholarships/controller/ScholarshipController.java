package com.iteam.scholarships.controller;
import com.iteam.scholarships.component.UplodeFille;
import com.iteam.scholarships.service.ScholarshipService;
import com.iteam.scholarships.wrapper.ShareScholarshipWrapper;
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


    @GetMapping("advertiser/scholarship/share")
    public String share(Model model) {
        model.addAttribute("wrapper", new ShareScholarshipWrapper());
        return "share-scholarship";
    }


    @PostMapping("advertiser/scholarship/share")
    public String share(@ModelAttribute("wrapper") ShareScholarshipWrapper wrapper, BindingResult bindingResult,
                        @RequestParam(value = "illustrationFile", required = false) MultipartFile file, Model model) {
        String line = "\n\n";

        wrapper.copyApplicantRequirement();
        wrapper.filterData();
        validator.validate(wrapper, bindingResult);

        System.out.println(line + wrapper + line);
        System.out.println(line + bindingResult + line);


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
            return "redirect:"
                    + wrapper.getScholarship().getId() + "/"
                    + wrapper.getScholarship().getTitle().replaceAll(" ", "-");
        }

        return "share-scholarship";
    }




    @GetMapping("advertiser/scholarship")
    public String viewAdvertedScholarship(Model model){
        model.addAttribute("scholarships", scholarshipService.getAllScholarships());
        return "adverted-scholarships";
    }


    @GetMapping({"user/scholarship/{id}", "user/scholarship/{id}/{title}"})
    public String viewScholarship(@PathVariable("id") int id, Model model) {

        // put data into model

        return "view-scholarship";
    }

}

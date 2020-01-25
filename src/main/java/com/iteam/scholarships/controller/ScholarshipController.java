package com.iteam.scholarships.controller;

import com.iteam.scholarships.component.UplodeFille;
import com.iteam.scholarships.entity.StudentInterest;
import com.iteam.scholarships.entity.scholarshipdb.AcademicInformation;
import com.iteam.scholarships.entity.scholarshipdb.SavedScholarship;
import com.iteam.scholarships.search.StudentSearch;
import com.iteam.scholarships.service.ScholarshipService;
import com.iteam.scholarships.service.StudentService;
import com.iteam.scholarships.service.UserService;
import com.iteam.scholarships.wrapper.ScholarshipWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.SmartValidator;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Controller
public class ScholarshipController {

    @Autowired
    private SmartValidator validator;
    @Autowired
    private UplodeFille uplodeFille;
    @Autowired
    private ScholarshipService scholarshipService;
    @Autowired
    private StudentSearch studentSearch;
    @Autowired
    private StudentService studentService;
    @Autowired
    private UserService userService;





    @GetMapping("/user/scholarship/search")
    public String search(Model model){
        return "search-scholarship";
    }

    @GetMapping("/advertiser/scholarship/applicant-student")
    public String applicantStudent(Model model){
        return "applicant-students";
    }


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
        String fileName = uplodeFille.uploadScholarshipIllustrationFile(file);
        wrapper.getDetail().setIllustrationFileName(fileName);
        if (scholarshipService.share(wrapper)) {
            return "redirect:/user/scholarship/"
                    + wrapper.getScholarship().getId() + "/"
                    + wrapper.getScholarship().getTitle().replaceAll(" ", "-");
        }else{
            uplodeFille.deleteScholarshipIllustrationFile(fileName);
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
            return "redirect:/user/scholarship/search";
        }

        scholarshipService.findForView(id, wrapper);
        if (wrapper.getScholarship() == null) {
            return "redirect:/user/scholarship/search";
        }

        model.addAttribute("user", userService.findUserHeader(wrapper.getScholarship().getAdvertiserId()));
        model.addAttribute("scholarship", wrapper.getScholarship());
        model.addAttribute("academicInformation", wrapper.getAcademicInformation());
        model.addAttribute("applicantRequirement", wrapper.getScholarshipAppReq());
        model.addAttribute("trainingInformation", wrapper.getTrainingInformation());
        model.addAttribute("tranningApplicantRequirment", wrapper.getTranningApplReq());
        model.addAttribute("scholarshipApplicationDetail", wrapper.getDetail());


        return "view-scholarship";
    }


    @GetMapping("/student/scholarship/wished")
    public String wishedScholarships(Model model){
        PageRequest p =  PageRequest.of(0, 10);
        Page<SavedScholarship> pages = scholarshipService.findSavedScholarships(p);

        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("saved",pages.getContent());

        return "wished-scholarship";
    }


    @GetMapping("/student/scholarship/match")
    public String match(Model model){
        StudentInterest studentInterest = studentService.findStudentInterest();
        String text =
                String.valueOf(studentInterest.getScholarshipType()) +" "+
                        String.valueOf(studentInterest.getFundType()) +" "+
                        String.valueOf(studentInterest.getDegree()) +" "+
                        String.valueOf(studentInterest.getLanguage()) +" "+
                        studentInterest.getMajor() +" "+
                        studentInterest.getCountry();

        List<AcademicInformation> scholarshipList = studentSearch.searchMatchScholarships(text);
        model.addAttribute("scholarshipList",scholarshipList);
        return "matches-scholarship";
    }



//    @GetMapping("scholarship/wished/{id}/&page={page}&size={size}")
//    public String wishedScholarships(@PathVariable(name= "id") int id, @PathVariable(name= "page") int page,
//                                     @PathVariable(name= "size") int size, Model model) {
//
//        Student student = studentService.find(id);
//        if(student.getId()<1)
//            return "search-scholarship";
//
//        model.addAttribute("id", student.getId());
//
//        PageRequest p =  PageRequest.of(page, size);
//        Page<SavedScholarship> pages = (Page<SavedScholarship>) scholarshipService.getAllSavedScholarshipsByUserId(student.getId(), p);
//
//        model.addAttribute("number", pages.getNumber());
//        model.addAttribute("totalPages", pages.getTotalPages());
//        model.addAttribute("totalElements", pages.getTotalElements());
//        model.addAttribute("size", pages.getSize());
//        model.addAttribute("saved",pages.getContent());
//        return "wished-scholarships";
//    }

}

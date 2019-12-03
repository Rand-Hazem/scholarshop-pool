package com.iteam.scholarships.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/scholarship/")
public class ScholarshipController {


    @GetMapping("share")
    public String share(Model model){

        return "share-scholarship";
    }


}

package com.iteam.scholarships.controller;

import com.iteam.scholarships.entity.Story;
import com.iteam.scholarships.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/story/")
public class StoryController {

    @Autowired
    private StoryService storyService;

    @GetMapping("share")
    public String shareStory(Model model) {
        model.addAttribute("story", new Story());
        return "share-story";
    }

    @PreAuthorize("hasAuthority('student')")
    @PostMapping("share")
    public String shareStory(@Valid @ModelAttribute("story") Story story, BindingResult bindingResult, Model model) {

        System.out.println("\n\n**" + story);
        System.out.println("\n\nBinding result " + bindingResult);
        if (!bindingResult.hasErrors() && storyService.save(story)) {
            System.out.println("\n\n" + story);
            return "profile";

        }
        return "share-story";
    }
}


package com.iteam.scholarships.controller;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.component.UplodeFille;
import com.iteam.scholarships.entity.Story;
import com.iteam.scholarships.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("story")
public class StoryController {

    @Autowired
    private StoryService storyService;
    @Autowired
    private UplodeFille uplodeFille;
    @Autowired
    private CurrentUser currentUser;

    @GetMapping("share")
    public String shareStory(Model model) {
        model.addAttribute("story", new Story());
        return "share-story";
    }

    @PostMapping("share")
    @PreAuthorize("hasAuthority('student')")
    public String shareStory(@Valid @ModelAttribute("story") Story story, BindingResult bindingResult,
                             @RequestParam(value = "img", required = false) MultipartFile[] imglist,
                             Model model, RedirectAttributes redirectAttributes) {

        boolean success = false;
        if (!bindingResult.hasErrors()) {
            story.setImgList(uplodeFille.uploadeStoryImage(imglist));
            success = storyService.save(story);
        }
        if(success){
            redirectAttributes.addFlashAttribute("story", story);
            return "redirect:"+story.getId()+"/view";
        }
        uplodeFille.deleteAllStoryImg(story.getImgList());
        return "share-story";
    }


//    @PostMapping("edit")
//    @PreAuthorize("hasAuthority('student')")
//    public String editStory(@Valid @ModelAttribute("story") Story story, BindingResult bindingResult,
//                             @RequestParam(value = "img", required = false) MultipartFile[] imglist, Model model) {
//
//        boolean success = false;
//        if (!bindingResult.hasErrors()) {
//            story.setImgList(uplodeFille.uploadeStoryImage(imglist));
//            success = storyService.save(story);
//        }
//        if(success){
//            model.addAttribute("story", story);
//            model.addAttribute("owner", true);
//            return viewStory(model);
//        }
//        uplodeFille.deleteAll(story.getImgList());
//        return "share-story";
//    }



    @GetMapping("{id}/view")
    public String viewStory(@PathVariable("id") int id, @ModelAttribute(name = "story")Story story ,Model model) {

        if(story == null){
            story = storyService.find(id);
        }
        model.addAttribute("story", story);
        //model.addAttribute("owner", currentUser.matchId(story.getUser().getId()));
        return "view-story";
    }



}





/*

    @PreAuthorize("hasAuthority('student')")
    @PostMapping("share")
    public String shareStory(@Valid @ModelAttribute("story") Story story, BindingResult bindingResult,
                             @RequestParam(value = "img-1", required = false) MultipartFile img1,
                             @RequestParam(value = "img-3", required = false) MultipartFile img2,
                             @RequestParam(value = "img-2", required = false) MultipartFile img3, Model model) {

        System.out.println("\n\n**" + story);
        System.out.println("\n\nBinding result " + bindingResult);
        if (!bindingResult.hasErrors() && storyService.save(story)) {
            System.out.println("\n\n" + story);
            return "profile";

        }
        return "share-story";
    }

 */

package com.iteam.scholarships.controller;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.component.UplodeFille;
import com.iteam.scholarships.entity.Story;
import com.iteam.scholarships.service.StoryLikeService;
import com.iteam.scholarships.service.StoryRateService;
import com.iteam.scholarships.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("story")
public class StoryController {

    @Autowired
    private StoryService storyService;
    @Autowired
    private UplodeFille uplodeFille;
    @Autowired
    private StoryLikeService storyLikeService;
    @Autowired
    private StoryRateService storyRateService;
    @Autowired
    private CurrentUser currentUser;


    @GetMapping("all")
    public String viewAllStories(Model model){
        return "stories";
    }


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
        if (success) {
            redirectAttributes.addFlashAttribute("story", story);
            return "redirect:" + story.getId() + "/" + story.getTitle().replaceAll(" ", "-");
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


    @GetMapping({"{id}", "{id}/{title}"})
    public String viewStory(@PathVariable("id") int id, @PathVariable(name = "title", required = false) String title, Model model, HttpServletRequest request) {
        Story story = storyService.findStoryForView(id);

        if(story == null ){
            return "redirect:all";
        }
        model.addAttribute("story", story);
        model.addAttribute("owner", currentUser.matchId(story.getUser().getId()));
        model.addAttribute("userLiked", storyLikeService.isCurrentUserLikeStory(story.getId()));
        model.addAttribute("userRate", storyRateService.getCurrentUserRate(story.getId()));
        return "view-story";
    }


}



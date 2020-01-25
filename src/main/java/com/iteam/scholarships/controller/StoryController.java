package com.iteam.scholarships.controller;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.component.UplodeFille;
import com.iteam.scholarships.entity.storydb.Story;
import com.iteam.scholarships.service.StoryLikeService;
import com.iteam.scholarships.service.StoryRateService;
import com.iteam.scholarships.service.StoryService;
import org.hibernate.search.jpa.FullTextQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/story/")
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


    @GetMapping("share")
    @PreAuthorize("hasAuthority('student')")
    public String share(Model model) {
        model.addAttribute("story", new Story());
        return "share-story";
    }

    @PostMapping("share")
    @PreAuthorize("hasAuthority('student')")
    public String share(@Valid @ModelAttribute("story") Story story, BindingResult bindingResult,
                        @RequestParam(value = "img", required = false) MultipartFile[] imglist,
                        Model model) {

        boolean success = false;
        if (!bindingResult.hasErrors()) {
            story.setImgList(uplodeFille.uploadeStoryImage(imglist));
            success = storyService.save(story);
        }
        if (success) {
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
    public String view(@PathVariable("id") int id, Model model) {
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



    @GetMapping("/all")
    public String viewAllStories(Model model){
        List<Story> storiesList = storyService.findTopRated();
        model.addAttribute("stories", storiesList);
        return "stories";
    }


    @GetMapping("/search")
    public String storiesSearch(
            @RequestParam(value="search", required=false) String searchText,
            @RequestParam(value="pageNo", required=false) Integer pageNo,
            Model model){

        if(searchText==null ||  pageNo == null){
            return "redirect:/story/all";
        }

        if (pageNo == null){
            pageNo = 1;
            model.addAttribute("pageNo", 1);
        }

        FullTextQuery fullTextQuery = storyService.searchStory(searchText);
        model.addAttribute("resultsCount", fullTextQuery.getResultSize());
        int pageCount =  (int) Math.floorDiv(storyService.count(), 10)+1;
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("stories", fullTextQuery.getResultList());

        return "stories";
    }



}



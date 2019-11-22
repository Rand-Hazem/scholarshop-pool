package com.iteam.scholarships.restController;

import com.iteam.scholarships.entity.StoryReport;
import com.iteam.scholarships.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/story/")
public class StoryResetController {

    @Autowired
    private StoryService storyService;

    @PutMapping("like")
    private ResponseEntity doLikeStory(@RequestParam Integer storyId){
        if(storyId < 1 || !storyService.likeStory(storyId)){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }

    @PutMapping("unlike")
    private ResponseEntity doUnLikeStory(@RequestParam Integer storyId){
        if(storyId < 1 || !storyService.unLikeStory(storyId)){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }

    @PutMapping("rate")
    private ResponseEntity doRate(@RequestParam Integer storyId, @RequestParam Integer rateValue){
        if(storyId < 1 || !storyService.rateStory(storyId, rateValue)){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }

    @PostMapping("report")
    private ResponseEntity report(StoryReport storyReport, Model model){

        if(storyReport != null && storyReport.getStoryId() >0
                && storyReport.getReportContentType() != null
                && storyService.reportStory(storyReport)
        ){
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.badRequest().build();
    }




}

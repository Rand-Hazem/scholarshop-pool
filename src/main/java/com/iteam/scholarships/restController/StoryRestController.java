package com.iteam.scholarships.restController;

import com.iteam.scholarships.entity.storydb.StoryReport;
import com.iteam.scholarships.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/story/")
public class StoryRestController {

    @Autowired
    private StoryService storyService;

    @PutMapping("like")
    private ResponseEntity doLikeStory(@RequestParam int storyId) {
        if (storyId < 1 || !storyService.like(storyId)) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }

    @PutMapping("unlike")
    private ResponseEntity doUnLikeStory(@RequestParam int storyId) {
        if (storyId < 1 || !storyService.unLike(storyId)) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }

    @PutMapping("rate")
    private ResponseEntity doRate(@RequestParam int storyId, @RequestParam int rateValue) {
        if (storyId < 1 || !storyService.rate(storyId, rateValue)) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }

    @PostMapping("report")
    private ResponseEntity report(StoryReport storyReport, Model model) {

        if (storyReport != null && storyReport.getStoryId() > 0
                && storyReport.getReportContentType() != null
                && storyService.report(storyReport)
        ) {
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.badRequest().build();
    }


    @DeleteMapping("delete")
    private ResponseEntity delete(@RequestParam int storyId) {
        try {
            if (storyId > 0 && storyService.delete(storyId)) {
                return ResponseEntity.ok("{\"location\":\"/story/all\"}");
            }

        } catch (Exception e) {
            System.out.println("\n\n" + e.getMessage() + "\n\n");
        }
        return ResponseEntity.badRequest().build();
    }


}

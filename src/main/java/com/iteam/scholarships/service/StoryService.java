package com.iteam.scholarships.service;

import com.iteam.scholarships.entity.*;
import com.iteam.scholarships.enums.NotificationType;
import com.iteam.scholarships.repository.StoryRepositoty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class StoryService {

    @Autowired
    private StoryRepositoty storyRepositoty;
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    @Autowired
    private StoryRateService storyRateService;
    @Autowired
    private StoryLikeService storyLikeService;
    @Autowired
    private NotificationService notificationService;
    @Autowired
    private ReportService reportService;


    public boolean save(Story story) {
        story.setUser(userService.getCurrentUserWithId());
        Story stored = storyRepositoty.save(story);
        return stored != null && stored.getId() > 0;
    }


    public Story findStoryForView(int id) {
        Story story = storyRepositoty.findById(id).orElse(null);
        if (story != null) {
            story.setUser(userService.findUserHeader(story.getUserId()));
            story.getUser().setUserOptionalInfoList(userService.findUserOptionalInfo(story.getUserId()));
        }
        return story;
    }


    public boolean like(int storyId) {
        Story story = storyRepositoty.findById(storyId).orElse(null);
        if (story == null) {
            return false;
        }
        StoryLike storyLike = new StoryLike();
        storyLike.setStory(story);
        storyLike.setUser(userService.getCurrentUserWithId());

        return storyLikeService.save(storyLike) && notificationService.sendLikeRateNotification(story, NotificationType.STORY_LIKE);
    }


    public boolean unLike(int storyId) {
        return storyLikeService.deleteByStoryAndUser(new Story(storyId), userService.getCurrentUserWithId());
    }


    public boolean rate(int storyId, int rateValue) {
        User user = userService.getCurrentUserWithId();
        Story story = storyRepositoty.findById(storyId).orElse(null);
        if(story == null){
            return false;
        }
        StoryRate storyRate = storyRateService.findByStoryAndUser(story, user);
        if (storyRate == null) {
            storyRate = new StoryRate();
            storyRate.setStory(story);
            storyRate.setUser(user);
            storyRate.setValue(rateValue);
        } else {
            storyRate.setValue(rateValue);
        }
        try {
            return storyRateService.save(storyRate) && notificationService.sendLikeRateNotification(story, NotificationType.STORY_RATE);
        } catch (Exception e) {
            return false;
        }
    }


    public boolean report(StoryReport storyReport) {
        try {
            storyReport.setReporterUser(userService.getCurrentUserWithId());
            storyReport.setStory(new Story(storyReport.getStoryId()));
            if (storyRepositoty.existsById(storyReport.getStoryId()) && reportService.report(storyReport)) {
                adminService.sedStoryReportNotification();
                return true;
            }

            return false;
        } catch (Exception e) {
            return false;
        }
    }


    public boolean delete(int storyId){
       return storyRepositoty.deleteByIdAndUser(storyId, userService.getCurrentUserWithId()) > 0;
    }




}

package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Story;
import com.iteam.scholarships.entity.StoryLike;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.repository.StoryLikeRepository;
import com.iteam.scholarships.repository.StoryRepositoty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoryService {

    @Autowired
    private UserService userService;
    @Autowired
    private StoryRepositoty storyRepositoty;
    @Autowired
    private StoryLikeRepository storyLikeRepository;

    public boolean save(Story story) {
        story.setUser(userService.getCurrentUserWithId());
        Story stored = storyRepositoty.save(story);
        return stored != null && stored.getId() > 0;
    }

    public Story findStoryForView(int id) {
        Story story = storyRepositoty.findById(id).orElse(null);
        if (story != null) {
            story.setRate(story.getRate()<1 ? 1 : story.getRate());
            story.setUser(userService.findUserHeader(story.getUserId()));
            story.getUser().setUserOptionalInfoList(userService.findUserOptionalInfo(story.getUserId()));
        }
        return story;
    }

    public boolean likeStory(int storyId){
        Story story = storyRepositoty.findById(storyId).orElse(null);
        if(story == null){
            return false;
        }
        StoryLike storyLike = new StoryLike();
        storyLike.setStory(story);
        storyLike.setUser(userService.getCurrentUserWithId());

        storyLikeRepository.save(storyLike);

        return true;
    }


}

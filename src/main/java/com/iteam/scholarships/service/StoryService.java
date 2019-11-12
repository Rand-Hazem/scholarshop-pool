package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Story;
import com.iteam.scholarships.repository.StoryRepositoty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoryService {

    @Autowired
    private UserService userService;
    @Autowired
    private StoryRepositoty storyRepositoty;

    public boolean save(Story story){
        story.setUser(userService.getCurrentUserWithId());
        Story stored = storyRepositoty.save(story);
        return stored!=null && stored.getId() > 0 ;
    }


}

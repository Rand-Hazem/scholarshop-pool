package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Story;
import com.iteam.scholarships.entity.StoryRate;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.repository.StoryRateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class StoryRateService {

    @Autowired
    private StoryRateRepository storyRateRepository;
    @Autowired
    private CurrentUser currentUser;

    public boolean save(StoryRate storyRate) {
        storyRateRepository.save(storyRate);
        return storyRate != null && storyRate.getId() > 0;
    }

    public StoryRate findByStoryAndUser(Story story, User user) {
        return storyRateRepository.findByStoryAndUser(story, user);
    }

    public int getCurrentUserRate(int storyId){
        if(!currentUser.isLogIn()){
            return 0;
        }
        Float rate = storyRateRepository.findCurrentUserRate(storyId, currentUser.getId());
        return rate==null ? 0 : rate.intValue();
    }

}

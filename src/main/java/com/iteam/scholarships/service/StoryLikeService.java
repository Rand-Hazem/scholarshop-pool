package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.storydb.Story;
import com.iteam.scholarships.entity.storydb.StoryLike;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.repository.StoryLikeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class StoryLikeService {

    @Autowired
    private StoryLikeRepository storyLikeRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private CurrentUser currentUser;


    public boolean save(StoryLike storyLike) {
        storyLikeRepository.save(storyLike);
        return storyLike != null && storyLike.getId() > 0;
    }

    public boolean deleteByStoryAndUser(Story story, User user) {
        return storyLikeRepository.deleteByStoryAndUser(story, user) > 0;
    }

    public boolean isCurrentUserLikeStory(int storyId){
        return currentUser.isLogIn() &&
                storyLikeRepository.isUserLikeStory(currentUser.getId(), storyId);
    }

}

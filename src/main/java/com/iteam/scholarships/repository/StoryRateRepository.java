package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.storydb.Story;
import com.iteam.scholarships.entity.storydb.StoryRate;
import com.iteam.scholarships.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StoryRateRepository extends CrudRepository<StoryRate, Integer> {

    StoryRate findByStoryAndUser(Story story, User user);

    @Query("select r.value from StoryRate r where r.storyId=:storyId and r.userId=:userId")
    Float findCurrentUserRate(@Param("storyId")int storyId, @Param("userId") int userId);
}

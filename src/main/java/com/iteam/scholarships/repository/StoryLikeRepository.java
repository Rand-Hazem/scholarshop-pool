package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.Story;
import com.iteam.scholarships.entity.StoryLike;
import com.iteam.scholarships.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StoryLikeRepository extends CrudRepository<StoryLike, Integer> {

    int deleteByStoryAndUser(Story story, User user);

    @Query(value = "select case " +
            "when count(l)>0 " +
            "then true " +
            "else false " +
            "end " +
            "from StoryLike l where l.userId=:userId and l.storyId=:storyId")
    boolean isUserLikeStory(@Param("userId") int userId, @Param("storyId") int storyId);
}

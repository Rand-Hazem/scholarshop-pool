package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.StoryLike;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StoryLikeRepository extends CrudRepository<StoryLike, Integer> {
}

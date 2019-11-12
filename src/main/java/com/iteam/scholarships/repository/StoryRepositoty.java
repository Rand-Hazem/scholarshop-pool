package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.Story;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StoryRepositoty extends JpaRepository<Story, Integer> {
}

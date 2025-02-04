package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.storydb.Story;
import com.iteam.scholarships.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Pageable;
import java.util.List;

@Repository
public interface StoryRepositoty extends JpaRepository<Story, Integer> {


    int deleteByIdAndUser(int storyId, User user);

    List<Story> findAllByUserId(int id);
    List<Story> findAllByUser(User user);

    List<Story> findAllByRateOrderByRate(Pageable pageable);


}
